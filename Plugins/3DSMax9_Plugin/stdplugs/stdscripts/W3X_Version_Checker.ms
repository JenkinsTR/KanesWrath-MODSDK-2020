
function W3X_Version_Checker =
(

-- This script verifies the date of your .w3x plugin
-- written by Sean O'Hara
	
	if (getFiles ("\\Autodesk\\3ds Max 9\\scripts\\w3x_version.txt")).count != 0 then
		(
		if (getFiles ("\\projects\\cnc\\cnc3\\production\\Tools\\ArtTools\\w3x_version.txt")).count != 0	then
			(
			CurrentFile = openFile ("\\3dsmax7\\scripts\\w3x_version.txt") mode:"r"
			CurrentVersionString = readLine CurrentFile 
			close CurrentFile 
			CurrentVersion= CurrentVersionString as integer
			
	
			PerFourFile = openFile ("\\projects\\cnc\\cnc3\\production\\Tools\\ArtTools\\w3x_version.txt") mode:"r"
			PerFourVersionString = readLine PerFourFile 
			close PerFourFile 
			PerFourVersion= PerFourVersionString as integer
	
			if (CurrentVersion < PerFourVersion) then
				(
				messageBox "WARNING: Your .W3X Plugin is out of date ! Please update your plugin now."
				print "old Year"
				)
				else
				(
				--messageBox "Up to date"
				print "Up to Date !"
				)
			print CurrentVersion
			print PerFourVersion
			)
			else
			(
				messageBox "WARNING: Your .W3X Plugin is out of date ! Please update your plugin now."
			)
		)
)

W3X_Version_Checker()

wwRunShaderCompiler ("\\projects\\cnc\\cnc3\\production\\run")
-- wwRunShaderCompiler ("E:\\Projects\\Sage2.0\\run")