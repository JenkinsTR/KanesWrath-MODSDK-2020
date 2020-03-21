using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Xml;
using Files;
using SAGE;

namespace SAGE.Compiler
{
	enum AudioCompressionSetting
	{
		NONE,
		XAS,
		EALAYER3
	}
	
	public class AudioFile : CompileHandler
	{
		public override bool Compile(GameAssetType gameAsset, Uri baseUri, BinaryAsset asset, XmlNode node, GameDefinition game,
			string trace, ref int position, out string ErrorDescription)
		{
			string exe = System.Reflection.Assembly.GetEntryAssembly().Location;
			// xml
			string file = null;
			string subtitle;
			int samplerate;
			int quality = 75;
			byte compression = 2;
			bool isstreamed = false;
			// wav
			int wfmtsize = 0;
			int wsamplerate = 0;
			int wdatasize = 0;
			short wfmt = 0;
			short wchannelcount = 0;
			short wsamplesize = 0;
			
			XmlNode subNode = node.Attributes.GetNamedItem("File");
			if (subNode != null) { file = subNode.Value; }
			
			if (file == null)
			{
				ErrorDescription = string.Format("No file set for AudioFile:{0}", trace);
				return false;
			}
			
			Uri fileUri = Macro.Parse(file);
			if (!fileUri.IsAbsoluteUri) { fileUri = new Uri(baseUri, fileUri); }
			
			file = fileUri.LocalPath;
			if (!File.Exists(file))
			{
				ErrorDescription = string.Format("File not found for AudioFile:{0}", trace);
				return false;
			}
			
			using (FileStream audioStream = new FileStream(file, FileMode.Open, FileAccess.Read, FileShare.Read))
			{
				using (BinaryReader audioReader = new BinaryReader(audioStream))
				{
					// resampling not implemented
					/*
					subNode = node.Attributes.GetNamedItem("PCSampleRate");
					if (subNode != null)
					{
						samplerate = Convert.ToInt32(subNode.Value);
					}
					else { samplerate = wsamplerate; }
					*/
					samplerate = wsamplerate;
					
					// predefined compression setting is used for now
					/*
					subNode = node.Attributes.GetNamedItem("PCCompression");
					if (subNode != null)
					{
						string[] enumValueNames = typeof(AudioCompressionSetting).GetEnumNames();
						for (int idx = 0; idx < enumValueNames.Length; ++idx)
						{
							if (enumValueNames[idx] == subNode.Value)
							{
								switch (idx)
								{
									case 1:
										compression = 4;
										break;
									case 2:
										compression = 5;
										break;
								}
							}
						}
					}
					*/
					string ext = Path.GetExtension(file).ToUpperInvariant();
					
					switch (ext)
					{
						case ".WAV":
							compression = 2;
							// fmt
							audioReader.BaseStream.Position = 0x10;
							wfmtsize = audioReader.ReadInt32();
							wfmt = audioReader.ReadInt16();
							audioReader.BaseStream.Position = 0x16;
							wchannelcount = audioReader.ReadInt16();
							wsamplerate = audioReader.ReadInt32();
							audioReader.BaseStream.Position = 0x22;
							wsamplesize = (short)(audioReader.ReadInt16() >> 3);
							// data
							audioReader.BaseStream.Position = 0x14 + wfmtsize + 0x04;
							wdatasize = audioReader.ReadInt32();

							if (wfmt != 1 || wsamplesize > 2)
							{
								ErrorDescription = string.Format("Invalid file type for AudioFile:{0}. Unsigned 8 bit or signed 16 bit PCM Wave file is needed.", trace);
								return false;
							}
							
							break;
						case ".MP3":
							compression = 5;
							break;
						default:
							ErrorDescription = string.Format("Invalid file type for AudioFile:{0}. Unsigned 8 bit or signed 16 bit PCM Wave file is needed.", trace);
							return false;
							break;
					}
					
					// only used for wav to EALayer3 conversion which is not implemented
					/*
					subNode = node.Attributes.GetNamedItem("PCQuality");
					if (subNode != null) { quality = Convert.ToInt32(subNode.Value); }
					*/
					
					subNode = node.Attributes.GetNamedItem("IsStreamedOnPC");
					if (subNode != null) { isstreamed = Convert.ToBoolean(subNode.Value); }
			
					subNode = node.Attributes.GetNamedItem("SubtitleStringName");
					if (subNode != null) { subtitle = subNode.Value; }
					else
					{
						subNode = node.Attributes.GetNamedItem("id");
						subtitle = string.Format("DialogEvent:{0}SubTitle", subNode.Value);
					}
			
					int stringLength = subtitle.Length;
					FileHelper.SetInt(stringLength, 0x04, asset.Content);
					stringLength += 4 - (stringLength % 4);
					BinaryAsset stringAsset = new BinaryAsset(stringLength);
					FileHelper.SetString(subtitle, 0, stringAsset.Content);
					asset.SubAssets.Add(0x08, stringAsset);
			
					BinaryAsset tempAsset = new BinaryAsset(0);
					BinaryAsset samplesAsset = new BinaryAsset(0);
					
					switch (compression)
					{
						case 2:
							// uncompressed
							int wsamplecount = wdatasize / wsamplesize;
							FileHelper.SetInt(wsamplecount / wchannelcount, 0x0C, asset.Content);
							FileHelper.SetInt(wsamplerate, 0x10, asset.Content);
							FileHelper.SetInt(wchannelcount, 0x1C, asset.Content);
			
							short iwsamplerate = FileHelper.Invert((short)wsamplerate);
							int iwsamplecount = FileHelper.Invert(wsamplecount / wchannelcount);
							int datasize = wsamplecount << 1;
							int pos = 0;
							short sample;
							
							samplesAsset = new BinaryAsset(wsamplecount << 1);
								
							for (int idx = 0; idx < wsamplecount; ++idx)
							{
								if (wsamplesize == 1) { sample = (short)((audioReader.ReadByte() - 0x80) << 8); }
								else { sample = audioReader.ReadInt16(); }
							
								if (sample < 0) { sample++; }
								else if (sample > 0) { sample--; }
							
								FileHelper.SetShort(FileHelper.Invert(sample), pos, samplesAsset.Content);
								pos += 2;
							}
						
							if (isstreamed)
							{
								tempAsset = new BinaryAsset(8);
								FileHelper.SetByte(compression, 0, tempAsset.Content);
								FileHelper.SetByte((byte)((wchannelcount - 1) << 2), 0x01, tempAsset.Content);
								FileHelper.SetShort(iwsamplerate, 0x02, tempAsset.Content);
								FileHelper.SetInt(iwsamplecount | 0x00000040, 0x04, tempAsset.Content);
				
								asset.SubAssets.Add(0x14, tempAsset);
								FileHelper.SetInt(8, 0x18, asset.Content);
				
								int blocksize;
								int lastblocksize;
								int blockcount;
								int samplecountperblock;
								pos = 0;
						
								blocksize = 0x07F8;
								blockcount = (datasize / blocksize);
								lastblocksize = datasize % blocksize;
								samplecountperblock = (blocksize >> 1) / wchannelcount;
								
								if (lastblocksize == 0) { lastblocksize = blocksize; }
								else { blockcount++; }
								
								asset.CData = new BinaryAsset((blockcount - 1) * (blocksize + 8) + lastblocksize + 8);
								
								for (int i = 0; i < blockcount - 1; ++i)
								{
									FileHelper.SetInt(FileHelper.Invert(blocksize + 8), pos, asset.CData.Content);
									pos += 4;
									FileHelper.SetInt(FileHelper.Invert(samplecountperblock), pos, asset.CData.Content);
									pos += 4;
									
									Array.Copy(samplesAsset.Content, i * blocksize, asset.CData.Content, pos, blocksize);
									pos += blocksize;
								}
								
								FileHelper.SetInt(FileHelper.Invert(lastblocksize + 8) | 0x00000080, pos, asset.CData.Content);
								pos += 4;
								FileHelper.SetInt(FileHelper.Invert((lastblocksize >> 1) / wchannelcount), pos, asset.CData.Content);
								pos += 4;
								
								Array.Copy(samplesAsset.Content, (blockcount - 1) * blocksize, asset.CData.Content, pos, lastblocksize);
							}
							else
							{
								tempAsset = new BinaryAsset(0x10);
								FileHelper.SetByte(compression, 0, tempAsset.Content);
								FileHelper.SetByte((byte)((wchannelcount - 1) << 2), 0x01, tempAsset.Content);
								FileHelper.SetShort(iwsamplerate, 0x02, tempAsset.Content);
								FileHelper.SetInt(iwsamplecount, 0x04, tempAsset.Content);
								FileHelper.SetInt(FileHelper.Invert(datasize + 8), 0x08, tempAsset.Content);
								FileHelper.SetInt(iwsamplecount, 0x0C, tempAsset.Content);
						
								asset.CData = new BinaryAsset(tempAsset.Content.Length + samplesAsset.Content.Length);
								Array.Copy(tempAsset.Content, 0, asset.CData.Content, 0, tempAsset.Content.Length);
								Array.Copy(samplesAsset.Content, 0, asset.CData.Content, tempAsset.Content.Length, samplesAsset.Content.Length);
							}
						
							break;
						case 4:
							// XAS
							break;
						case 5:
							// EALayer3
							
							// only streamed EALayer3 is supported yet
							isstreamed = true;
							
							string tempfile = exe + "_1.temp";
							
							Process p = new Process();
							p.StartInfo.FileName = Path.GetDirectoryName(exe) + "\\EALayer3.exe";
							p.StartInfo.UseShellExecute = false;
							p.StartInfo.CreateNoWindow = true;
							p.StartInfo.Arguments = "-E \"" + file + "\" --single-block -o \"" + tempfile + "\"";
							p.Start();
							p.WaitForExit();
							
							using (FileStream ealayer3Stream = new FileStream(tempfile, FileMode.Open, FileAccess.Read, FileShare.Read))
							{
								using (BinaryReader ealayer3Reader = new BinaryReader(ealayer3Stream))
								{
									ealayer3Reader.BaseStream.Position = 1;
									FileHelper.SetInt((int)(ealayer3Reader.ReadByte() / 4 + 1), 0x1C, asset.Content);
									FileHelper.SetInt((int)FileHelper.Invert(ealayer3Reader.ReadInt16()), 0x10, asset.Content);
									FileHelper.SetInt(FileHelper.Invert(ealayer3Reader.ReadInt32()), 0x0C, asset.Content);
									
									if (isstreamed)
									{
										string tempfile2 = exe + "_2.temp";
										
										ealayer3Reader.BaseStream.Position = 0;
										tempAsset = new BinaryAsset(8);
										FileHelper.SetInt(ealayer3Reader.ReadInt32(), 0, tempAsset.Content);
										FileHelper.SetInt(ealayer3Reader.ReadInt32() | 0x00000040, 4, tempAsset.Content);
										
										asset.SubAssets.Add(0x14, tempAsset);
										FileHelper.SetInt(8, 0x18, asset.Content);
										
										p = new Process();
										p.StartInfo.FileName = Path.GetDirectoryName(exe) + "\\EALayer3.exe";
										p.StartInfo.UseShellExecute = false;
										p.StartInfo.CreateNoWindow = true;
										p.StartInfo.Arguments = "-E \"" + file + "\" -o \"" + tempfile2 + "\"";
										p.Start();
										p.WaitForExit();
										
										using (FileStream ealayer3Stream2 = new FileStream(tempfile2, FileMode.Open, FileAccess.Read, FileShare.Read))
										{
											using (BinaryReader ealayer3Reader2 = new BinaryReader(ealayer3Stream2))
											{
												ealayer3Reader2.BaseStream.Position = 0;
												asset.CData = new BinaryAsset((int)ealayer3Stream2.Length);
												asset.CData.Content = ealayer3Reader2.ReadBytes((int)ealayer3Stream2.Length);
												FileHelper.SetByte(0, 8, asset.CData.Content);
											}
										}
										
										File.Delete(tempfile2);
									}
									else
									{
										ealayer3Reader.BaseStream.Position = 0;
										asset.CData = new BinaryAsset((int)ealayer3Stream.Length);
										asset.CData.Content = ealayer3Reader.ReadBytes((int)ealayer3Stream.Length);
									}
								}
							}
							
							File.Delete(tempfile);
							break;
					}
				}
			}
			
			asset.IsWritingCDataHead = false;
			ErrorDescription = string.Empty;
			return true;
		}
	}
}
