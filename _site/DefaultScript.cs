//===========================================================//
//===== ABOUT ===============================================//
//===========================================================//
//                                                           //
// Extended build script for the Command & Conquer 3 Mod SDK //
//                                                           //
// Author: Bibber                                            //
// eMail: m.bibber@web.de                                    //
// Homepage: http://bibber.bplaced.net                       //
//                                                           //
//===========================================================//
//===== PROGRAM =============================================//
//===========================================================//

using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using Microsoft.Win32;

namespace EALABuild
{
    class BuildScript: EALABuildScript
    {
		#region Member variables
        Dictionary<string, Object> currentGUIData;
        static int MOD_BUILD_STEPS = 6;
        static string DEFAULT_GAME_VERSION = "1.9";
		static string DEFAULT_MOD_VERSION = "1.0";
		
		// Variables
		object Reg;
		string Cmd = Environment.GetEnvironmentVariable("comspec");
		string PersonalDirectory;
		string SDKDirectory;
		string UserDataLeafName;
		
		string BuiltModsPath;
		string BinaryAssetBuilder;
		string AssetResolver;
		string HashFix;
		string LoDStreamBuilder;
		string MakeBig;
		
		string Mod;
		string ModPath;
		string ModAdditionalFilesPath;
		string ModDataPath;
		string BuiltModPath;
		string BuiltModDataPath;
		string BuiltModShaderPath;
		string ModInstallPath;
		
		string ModXml;
		string ModBig;
		string ModSkudef;
		#endregion

		#region Implementation of EALABuildScript interface.
        public static void CopyFolders(string source, string destination)
        {
			if (!Directory.Exists(destination)) Directory.CreateDirectory(destination);
			
            DirectoryInfo di = new DirectoryInfo(source);
            CopyFiles(source, destination);

            foreach (DirectoryInfo d in di.GetDirectories())
            {
                string newDir = Path.Combine(destination, d.Name);
                CopyFolders(d.FullName, newDir);
            }
        }

        public static void CopyFiles(string source, string destination)
        {
            DirectoryInfo di = new DirectoryInfo(source);
            FileInfo[] files = di.GetFiles();

            foreach (FileInfo f in files)
            {
                string sourceFile = f.FullName;
                string destFile = Path.Combine(destination, f.Name);
                File.Copy(sourceFile, destFile, true);
            }
        }
		
		// This function is called immediately after the script constructor in the GUI load process.
        public void initialize()
        {
			/*
			* This will automatically reset the counter in BuildHelper, and the GUI will
			* set the type of build in BuildHelper.  If it is not enabled, call 
			* BuildHelper.Reset, and set BuildHelper.CurrentBuildType = to either BuildType.ModBuild
			* or BuildType.MapBuild in the buildMap and buildMod functions
			*/
			
            BuildHelper.AutomaticallyResetBuildHelper = true;
            BuildHelper.EnableBenchmarking = true;
			
			// Personal Directory
			PersonalDirectory = Environment.ExpandEnvironmentVariables(Registry.GetValue("HKEY_CURRENT_USER\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\User Shell Folders", "Personal", "").ToString());
			
			// SDK Directory
			Reg = Registry.GetValue("HKEY_LOCAL_MACHINE\\Software\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\{86C7336D-0E3A-4953-ADF4-F4B5E0096278}", "InstallLocation", null);
			if (Reg == null) { 
				Reg = Registry.GetValue("HKEY_LOCAL_MACHINE\\Software\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\{86C7336D-0E3A-4953-ADF4-F4B5E0096278}", "InstallLocation", null);
				if (Reg == null) { 
					SDKDirectory = StaticPaths.CurrentDirectory;
				} else {
					SDKDirectory = Reg.ToString();
				}
			} else {
				SDKDirectory = Reg.ToString();
			}
			
			// User Data Leaf Name
			Reg = Registry.GetValue("HKEY_LOCAL_MACHINE\\Software\\Electronic Arts\\Electronic Arts\\Command and Conquer 3", "UserDataLeafName", null);
			if (Reg == null) { 
				Reg = Registry.GetValue("HKEY_LOCAL_MACHINE\\Software\\Wow6432Node\\Electronic Arts\\Electronic Arts\\Command and Conquer 3", "UserDataLeafName", null);
				if (Reg == null) { 
					UserDataLeafName = "Command & Conquer 3 Tiberium Wars";
				} else {
					UserDataLeafName = Reg.ToString();
				}
			} else {
				UserDataLeafName = Reg.ToString();
			}
			
			// Variables
			BuiltModsPath = SDKDirectory + "\\builtmods";
			BinaryAssetBuilder = SDKDirectory + "\\tools\\binaryassetbuilder.exe";
			AssetResolver = SDKDirectory + "\\tools\\assetresolver.exe";
			HashFix = SDKDirectory + "\\tools\\hashfix.exe";
			LoDStreamBuilder = SDKDirectory + "\\tools\\lodstreambuilder.exe";
			MakeBig = SDKDirectory + "\\tools\\makebig.exe";
        }

		// This function is called on the successful completion of a build step.
        public void onStepSuccess(int stepId)
        {
            if (BuildHelper.GetNextExecutableStep() != -1)
            {
                executeModBuildStep(BuildHelper.CurrentStep);
            }
            else
            {
                BuildHelper.OnBuildComplete();
            }
        }

		// This function is called on the failure of a build step.
        public void onStepFailure(int stepId)
        {
            BuildHelper.DisplayLine(String.Format("Build failed on step {0}", BuildHelper.CurrentStep-1));
        }

		// This function is called to determine if a step should execute.
        public bool shouldExecuteStep(int stepId)
        {
            if (currentGUIData.ContainsKey("step" + stepId))
            {
                if ((bool)currentGUIData["step" + stepId])
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            return true;
        }

		// This function is called when the user elects to build a mod
        public void buildMod(string modName, Dictionary<string, Object> GUIResults)
        {
            currentGUIData = GUIResults;
            BuildHelper.CurrentBuildSteps = MOD_BUILD_STEPS;
			
			//Variables
			Mod = BuildHelper.BuildTarget;
			ModPath = SDKDirectory + "\\mods\\" + Mod;
			ModAdditionalFilesPath = ModPath + "\\additional";
			ModDataPath = ModPath + "\\data";
			BuiltModPath = BuiltModsPath + "\\mods\\" + Mod;
			BuiltModDataPath = BuiltModPath + "\\data";
			ModInstallPath = PersonalDirectory + "\\" + UserDataLeafName + "\\Mods\\" + Mod;
			
			ModXml = ModDataPath + "\\mod.xml";
			ModBig = Mod + "_" + (string)currentGUIData["modversion"] + ".big";
			ModSkudef = Mod + "_" + (string)currentGUIData["modversion"] + ".skudef";
			
            executeModBuildStep(BuildHelper.GetNextExecutableStep());
        }
		
		/*
		* This function is called during the GUI initialization to generate
		* the GUI for the mod build options section.
		*/
        public List<GUIElementData> GetModBuildGUIData()
        {
            List<GUIElementData> modGUIData = new List<GUIElementData>();
			modGUIData.Add(new GUIElementData("step1", "Clear built mod", GUIElementData.CheckBoxType, ScriptIndex.ModScript));
			modGUIData.Add(new GUIElementData("step2", "Clear cache", GUIElementData.CheckBoxType, ScriptIndex.ModScript));
			modGUIData.Add(new GUIElementData("sp1", "", GUIElementData.LabelType, ScriptIndex.ModScript));
            modGUIData.Add(new GUIElementData("step3", "Build global data", GUIElementData.CheckBoxType, ScriptIndex.ModScript));
            modGUIData.Add(new GUIElementData("step4", "Build static data", GUIElementData.CheckBoxType, ScriptIndex.ModScript));
            modGUIData.Add(new GUIElementData("sp2", "", GUIElementData.LabelType, ScriptIndex.ModScript));
			modGUIData.Add(new GUIElementData("step5", "Copy additional files", GUIElementData.CheckBoxType, ScriptIndex.ModScript));
            modGUIData.Add(new GUIElementData("sp3", "", GUIElementData.LabelType, ScriptIndex.ModScript));
			modGUIData.Add(new GUIElementData("step6", "Create big and skudef file", GUIElementData.CheckBoxType, ScriptIndex.ModScript));
			modGUIData.Add(new GUIElementData("gv", "Game version:", GUIElementData.LabelType, ScriptIndex.ModScript));
            modGUIData.Add(new GUIElementData("gameversion", DEFAULT_GAME_VERSION, GUIElementData.InputBoxType, ScriptIndex.ModScript));
            modGUIData.Add(new GUIElementData("mv", "Mod version:", GUIElementData.LabelType, ScriptIndex.ModScript));
            modGUIData.Add(new GUIElementData("modversion", DEFAULT_MOD_VERSION, GUIElementData.InputBoxType, ScriptIndex.ModScript));
			return modGUIData;
        }
        #endregion
	
        private void executeModBuildStep(int stepId)
        {
			string ModFix;
		
            switch(stepId)
            {
                case 1:
					BuildHelper.DisplayLine(String.Format("Step {0}: Clearing built mod",
							stepId));
                    RunExecutableArguments clearMod = new RunExecutableArguments(Cmd);
                    clearMod.Arguments = String.Format("/C (@echo off) & (cd /D \"{0}\")"
						+ " & (for /R \"{1}\" %I in (\"*.*\") do ("
							+ "(if not \"%~xI\" == \".asset\" (del \"%I\" /F /Q))"
						+ "))",
						SDKDirectory, BuiltModPath);
					BuildHelper.RunStep(StepType.RunExecutable, clearMod);
                    break;
                case 2:
					BuildHelper.DisplayLine(String.Format("Step {0}: Clearing cache",
							stepId));
                    RunExecutableArguments clearCache = new RunExecutableArguments(Cmd);
                    clearCache.Arguments = String.Format("/C (@echo off) & (cd /D \"{0}\")"
						+ " & (if exist \"{1}\\builtmods\" (rd \"{1}\\builtmods\" /S /Q))"
						+ " & (for /R \"{2}\" %I in (\"*.asset\") do (del \"%I\" /F /Q))"
						+ " & (if exist \"{1}\\stringhashes.xml\" (del \"{1}\\stringhashes.xml\" /F /Q))",
						SDKDirectory, BuiltModsPath, BuiltModPath);
					BuildHelper.RunStep(StepType.RunExecutable, clearCache);
                    break;
                case 3:
					BuildHelper.DisplayLine(String.Format("Step {0}: Building global data",
						stepId));
					RunExecutableArguments argsGlobal = new RunExecutableArguments(Cmd);
					argsGlobal.Arguments = String.Format("/C (@echo off) & (cd /D \"{0}\")"
						+ " & (for /R \"{1}\\additionalmaps\" %I in (\"mapmetadata_*\") do ("
							+ "(del \"%I\" /F /Q)"
							+ " & (if exist \"%~dpnI\" ("
								+ "(cd /D \"%~dpnI\")"
								+ " & (for /R %J in (\"*.cdata\") do (del \"%J\" /F /Q))"
								+ " & (cd /D \"{0}\")"
							+ "))"
						+ "))"
						+ " & (for /R \"{3}\\additionalmaps\" %I in (\"mapmetadata_*.xml\") do ("
							+ "(\"{2}\" \"%I\" /od:\"{4}\" /iod:\"{4}\" /ls:true /pc:true /audio:\".\\mods\\{5}\\audio;.\\audio\" /art:\".\\mods\\{5}\\art;.\\art\" /data:\".;.\\mods;.\\mods\\{5}\\data;.\\cnc3xml\")"
						+ "))",
						SDKDirectory, BuiltModDataPath, BinaryAssetBuilder, ModDataPath, BuiltModsPath, Mod);
					BuildHelper.RunStep(StepType.RunExecutable, argsGlobal);
					break;
                case 4:
					BuildHelper.DisplayLine(String.Format("Step {0}: Building static data",
						stepId));
                    RunExecutableArguments args = new RunExecutableArguments(Cmd);
					args.Arguments = String.Format("/C (@echo off) & (cd /D \"{0}\")"
						+ " & (if exist \"{1}\\mod.bin\" (del \"{1}\\mod.bin\" /F /Q))"
						+ " & (if exist \"{1}\\mod.imp\" (del \"{1}\\mod.imp\" /F /Q))"
						+ " & (if exist \"{1}\\mod.manifest\" (del \"{1}\\mod.manifest\" /F /Q))"
						+ " & (if exist \"{1}\\mod.relo\" (del \"{1}\\mod.relo\" /F /Q))"
						+ " & (if exist \"{1}\\mod.version\" (del \"{1}\\mod.version\" /F /Q))"
						+ " & (for /R \"{1}\\mod\" %I in (\"*.cdata\") do (del \"%I\" /F /Q))"
						+ " & (for /R \"{1}\" %I in (\"mod_*\") do ("
							+ "(del \"%I\" /F /Q)"
							+ " & (if exist \"%~dpnI\" ("
								+ "(cd /D \"%~dpnI\")"
								+ " & (for /R %J in (\"*.cdata\") do (del \"%J\" /F /Q))"
								+ " & (cd /D \"{0}\")"
							+ "))"
						+ "))"
						+ " & (\"{2}\" \"{3}\" /od:\"{4}\" /iod:\"{4}\" /ls:true /pc:true /audio:\".\\mods\\{5}\\audio;.\\audio\" /art:\".\\mods\\{5}\\art;.\\art\" /data:\".;.\\mods;.\\mods\\{5}\\data;.\\cnc3xml\")"
						+ " & (\"{6}\" \"{1}\\mod.manifest\")"
						+ " & (copy \"{4}\\cnc3xml\\worldbuilder.manifest\" \"{1}\\worldbuilder.manifest\" /Y)"
						+ " & (\"{7}\" -m \"{1}\\mod.manifest\" -s mod)"
						+ " & (if exist \"{1}\\worldbuilder.manifest\" (del \"{1}\\worldbuilder.manifest\" /F /Q))"
						+ " & (\"{8}\" \"{1}\\mod.manifest\")",
						SDKDirectory, BuiltModDataPath, BinaryAssetBuilder, ModXml, BuiltModsPath, Mod, HashFix, AssetResolver, LoDStreamBuilder);
					BuildHelper.RunStep(StepType.RunExecutable, args);
                    break;
                case 5:
					BuildHelper.DisplayLine(String.Format("Step {0}: Copying additional files",
							stepId));
					RunExecutableArguments argsCopyFiles = new RunExecutableArguments(Cmd);
					argsCopyFiles.Arguments = String.Format("/C (@echo off) & (cd /D \"{0}\")",
						SDKDirectory);
						
					if (Directory.Exists(ModAdditionalFilesPath)) CopyFolders(ModAdditionalFilesPath, BuiltModPath);
					
					BuildHelper.RunStep(StepType.RunExecutable, argsCopyFiles);
                    break;
                case 6:
					BuildHelper.DisplayLine(String.Format("Step {0}: Creating big and skudef file",
							stepId));
					RunExecutableArguments argsBigSkudef = new RunExecutableArguments(Cmd);
					argsBigSkudef.Arguments = String.Format("/C (@echo off) & (cd /D \"{0}\")"
						+ " & (\"{1}\" -f \"{2}\" -x:*.asset -o:\"{3}\\{4}\")"
						+ " & (if exist \"{3}\\{5}\" (del \"{3}\\{5}\" /F /Q))"
						+ " & (cd /D \"{3}\")"
						+ " & (echo mod-game {6}>\"{5}\")"
						+ " & (echo add-big {4}>>\"{5}\")",
						SDKDirectory, MakeBig, BuiltModPath, ModInstallPath, ModBig, ModSkudef, (string)currentGUIData["gameversion"]);
                    BuildHelper.RunStep(StepType.RunExecutable, argsBigSkudef);
                    break;
                default:
                    // unknown build step, this is probably the end
					onStepSuccess(-1);
                    break;
            }
        }
    }
}

//===========================================================//
//===========================================================//
//===========================================================//