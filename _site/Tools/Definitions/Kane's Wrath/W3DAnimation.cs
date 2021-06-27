using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Xml;
using Files;
using SAGE;

namespace SAGE.Compiler
{
	enum AnimationChannelType
	{
		XTranslation = 0,
		YTranslation,
		ZTranslation,
		Orientation,
		Visibility
	}

	public class W3DAnimation : CompileHandler
	{
		public override bool Compile(GameAssetType gameAsset, Uri baseUri, BinaryAsset asset, XmlNode node, GameDefinition game,
			string trace, ref int position, out string ErrorDescription)
		{
			foreach (BaseEntryType entry in gameAsset.Runtime.Entries)
			{
				if (entry.id == "Channels")
				{
					continue;
				}
				if (!entry.Compile(baseUri, asset, node, game, "W3DAnimation", ref position, out ErrorDescription))
				{
					return false;
				}
			}
			uint numFrames = uint.Parse(node.Attributes.GetNamedItem("NumFrames").Value);
			uint timecodedHash = StringHasher.Hash("AnimationChannelTimecoded");
			List<BinaryAsset> channelList = new List<BinaryAsset>();
			foreach (XmlNode childNode in node.ChildNodes)
			{
				if (childNode.Name == "Channels")
				{
					foreach (XmlNode channelNode in childNode)
					{
						if (channelNode.Name == "ChannelScalar" || channelNode.Name == "ChannelQuaternion")
						{
							BinaryAsset channelAsset = new BinaryAsset(36);
							int subPosition = 0;
							FileHelper.SetUInt(timecodedHash, subPosition, channelAsset.Content);
							subPosition += 4;
							string value = channelNode.Attributes.GetNamedItem("Type").Value;
							string[] enumValueNames = typeof(AnimationChannelType).GetEnumNames();
							for (int idx = 0; idx < enumValueNames.Length; ++idx)
							{
								if (enumValueNames[idx] == value)
								{
									FileHelper.SetInt(idx, subPosition, channelAsset.Content);
									break;
								}
							}
							subPosition += 4;
							FileHelper.SetUInt(numFrames, subPosition, channelAsset.Content);
							subPosition += 4;
							int vectorLenPosition = subPosition;
							subPosition += 4;
							FileHelper.SetUShort(ushort.Parse(channelNode.Attributes.GetNamedItem("Pivot").Value), subPosition, channelAsset.Content);
							subPosition += 4;
							uint firstFrame = uint.Parse(channelNode.Attributes.GetNamedItem("FirstFrame").Value);
							if (channelNode.Name == "ChannelScalar")
							{
								FileHelper.SetUInt(1, vectorLenPosition, channelAsset.Content);
								FileHelper.SetUInt(numFrames, subPosition, channelAsset.Content);
								subPosition += 4;
								BinaryAsset frameAndBinaryFlagList = null;
								int sageUnsignedShortCount = 2 - ((int)numFrames & 1);
								if (sageUnsignedShortCount == 2)
								{
									frameAndBinaryFlagList = new BinaryAsset((int)numFrames << 1);
								}
								else
								{
									frameAndBinaryFlagList = new BinaryAsset(((int)numFrames + sageUnsignedShortCount) << 1);
								}
								channelAsset.SubAssets.Add(subPosition, frameAndBinaryFlagList);
								subPosition += 4;
								for (ushort idx = 0; idx < numFrames; ++idx)
								{
									FileHelper.SetUShort(idx, idx << 1, frameAndBinaryFlagList.Content);
								}
								FileHelper.SetUInt(numFrames, subPosition, channelAsset.Content);
								subPosition += 4;
								BinaryAsset valuesList = new BinaryAsset((int)numFrames << 2);
								channelAsset.SubAssets.Add(subPosition, valuesList);
								int index = 0;
								int frame = int.Parse(channelNode.Attributes.GetNamedItem("FirstFrame").Value);
								int framePosition = 0;
								foreach (XmlNode frameNode in channelNode.ChildNodes)
								{
									if (frameNode.Name == "Frame")
									{
										if (index < firstFrame)
										{
											++index;
											continue;
										}
										FileHelper.SetFloat(float.Parse(frameNode.InnerText, NumberFormatInfo.InvariantInfo), framePosition, valuesList.Content);
										framePosition += 4;
										++index;
										if (index - firstFrame == numFrames)
										{
											break;
										}
									}
								}
							}
							else
							{
								FileHelper.SetUInt(4, vectorLenPosition, channelAsset.Content);
								FileHelper.SetUInt(numFrames, subPosition, channelAsset.Content);
								subPosition += 4;
								BinaryAsset frameAndBinaryFlagList = null;
								int sageUnsignedShortCount = 2 - ((int)numFrames & 1);
								if (sageUnsignedShortCount == 2)
								{
									frameAndBinaryFlagList = new BinaryAsset((int)numFrames << 1);
								}
								else
								{
									frameAndBinaryFlagList = new BinaryAsset(((int)numFrames + sageUnsignedShortCount) << 1);
								}
								channelAsset.SubAssets.Add(subPosition, frameAndBinaryFlagList);
								subPosition += 4;
								for (ushort idx = 0; idx < numFrames; ++idx)
								{
									FileHelper.SetUShort(idx, idx << 1, frameAndBinaryFlagList.Content);
								}
								FileHelper.SetUInt(numFrames << 2, subPosition, channelAsset.Content);
								subPosition += 4;
								BinaryAsset valuesList = new BinaryAsset((int)numFrames << 4);
								channelAsset.SubAssets.Add(subPosition, valuesList);
								int index = 0;
								int framePosition = 0;
								int frame = int.Parse(channelNode.Attributes.GetNamedItem("FirstFrame").Value);
								foreach (XmlNode frameNode in channelNode.ChildNodes)
								{
									if (frameNode.Name == "Frame")
									{
										if (index < firstFrame)
										{
											++index;
											continue;
										}
										FileHelper.SetFloat(float.Parse(frameNode.Attributes.GetNamedItem("X").Value, NumberFormatInfo.InvariantInfo), framePosition, valuesList.Content);
										framePosition += 4;
										FileHelper.SetFloat(float.Parse(frameNode.Attributes.GetNamedItem("Y").Value, NumberFormatInfo.InvariantInfo), framePosition, valuesList.Content);
										framePosition += 4;
										FileHelper.SetFloat(float.Parse(frameNode.Attributes.GetNamedItem("Z").Value, NumberFormatInfo.InvariantInfo), framePosition, valuesList.Content);
										framePosition += 4;
										FileHelper.SetFloat(float.Parse(frameNode.Attributes.GetNamedItem("W").Value, NumberFormatInfo.InvariantInfo), framePosition, valuesList.Content);
										framePosition += 4;
										++index;
										if (index - firstFrame == numFrames)
										{
											break;
										}
									}
								}
							}
							channelList.Add(channelAsset);
						}
					}
					break;
				}
			}
			BinaryAsset choiceAsset = new BinaryAsset(channelList.Count << 2);
			FileHelper.SetInt(channelList.Count, position, asset.Content);
			position += 4;
			asset.SubAssets.Add(position, choiceAsset);
			int choicePosition = 0;
			foreach (BinaryAsset choice in channelList)
			{
				choiceAsset.SubAssets.Add(choicePosition, choice);
				choicePosition += 4;
			}
			ErrorDescription = string.Empty;
			return true;
		}
	}
}
