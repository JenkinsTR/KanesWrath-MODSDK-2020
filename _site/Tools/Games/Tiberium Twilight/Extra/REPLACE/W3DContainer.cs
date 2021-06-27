using System;
using System.Collections.Generic;
using System.IO;
using System.Xml;
using Files;
using SAGE;

namespace SAGE.Compiler
{
	public class W3DMesh : CompileHandler
	{
		public override bool Compile(GameAssetType gameAsset, Uri baseUri, BinaryAsset asset, XmlNode node, GameDefinition game,
			string trace, ref int position, out string ErrorDescription)
		{
			XmlNode subNode = node.Attributes.GetNamedItem("Hierarchy");
			string value = null;
			if (subNode != null)
			{
				value = subNode.Value;
			}
			else
			{
				value = string.Empty;
			}
			if (value != string.Empty)
			{
				string[] name = value.Split(':');
				if (name.Length == 1)
				{
					asset.AssetImports.Add(position, new uint[] { StringHasher.Hash("W3DHierarchy"), StringHasher.Hash(name[0].ToLowerInvariant()) });
				}
				else
				{
					asset.AssetImports.Add(position, new uint[] { StringHasher.Hash(name[0]), StringHasher.Hash(name[1].ToLowerInvariant()) });
				}
			}
			position += 4;
			List<XmlNode> subObjectNodes = new List<XmlNode>();
			foreach (XmlNode childNode in node.ChildNodes)
			{
				if (childNode.Name == "SubObject")
				{
					subObjectNodes.Add(childNode);
				}
			}
			FileHelper.SetInt(subObjectNodes.Count, position, asset.Content);
			position += 4;
			BinaryAsset subObjectAsset = new BinaryAsset(0x10 * subObjectNodes.Count);
			asset.SubAssets.Add(position, subObjectAsset);
			int subPosition = 0;
			foreach (XmlNode childNode in subObjectNodes)
			{
				SAGE.Types.SageUnsignedInt suint = new Types.SageUnsignedInt(childNode.Attributes.GetNamedItem("BoneIndex").Value);
				FileHelper.SetUInt(suint.Value, subPosition, subObjectAsset.Content);
				subPosition += 4;
				subNode = null;
				subNode = childNode.Attributes.GetNamedItem("SubObjectID");
				if (subNode != null)
				{
					value = subNode.Value;
				}
				else
				{
					value = string.Empty;
				}
				if (value == string.Empty)
				{
					subPosition += 8;
				}
				else
				{
					int stringLength = value.Length;
					FileHelper.SetInt(stringLength, subPosition, subObjectAsset.Content);
					subPosition += 4;
					stringLength += 4 - (stringLength & 3);
					BinaryAsset stringAsset = new BinaryAsset(stringLength);
					FileHelper.SetString(value, 0, stringAsset.Content);
					subObjectAsset.SubAssets.Add(subPosition, stringAsset);
					subPosition += 4;
				}
				foreach (XmlNode renderObjectNode in childNode.ChildNodes)
				{
					if (renderObjectNode.Name == "RenderObject")
					{
						foreach (XmlNode referenceNode in renderObjectNode.ChildNodes)
						{
							if (referenceNode.Name == "Mesh")
							{
								value = referenceNode.InnerText;
								string[] name = value.Split(':');
								if (name.Length == 1)
								{
									subObjectAsset.AssetImports.Add(subPosition, new uint[] { StringHasher.Hash("W3DMesh"), StringHasher.Hash(name[0].ToLowerInvariant()) });
								}
								else
								{
									subObjectAsset.AssetImports.Add(subPosition, new uint[] { StringHasher.Hash(name[0]), StringHasher.Hash(name[1].ToLowerInvariant()) });
								}
								break;
							}
							else if (referenceNode.Name == "CollisionBox")
							{
								value = referenceNode.InnerText;
								string[] name = value.Split(':');
								if (name.Length == 1)
								{
									subObjectAsset.AssetImports.Add(subPosition, new uint[] { StringHasher.Hash("W3DCollisionBox"), StringHasher.Hash(name[0].ToLowerInvariant()) });
								}
								else
								{
									subObjectAsset.AssetImports.Add(subPosition, new uint[] { StringHasher.Hash(name[0]), StringHasher.Hash(name[1].ToLowerInvariant()) });
								}
								break;
							}
						}
						break;
					}
				}
				subPosition += 4;
			}
			ErrorDescription = string.Empty;
			return true;
		}
	}
}
