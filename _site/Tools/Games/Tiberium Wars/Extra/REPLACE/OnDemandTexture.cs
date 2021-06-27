using System;
using System.Collections.Generic;
using System.IO;
using System.Xml;
using Files;
using SAGE;

namespace SAGE.Compiler
{
	enum TextureType
	{
		StandardTexture,
		VolumeTexture,
		CubeTexture
	}

	public class OnDemandTexture : CompileHandler
	{
		public override bool Compile(GameAssetType gameAsset, Uri baseUri, BinaryAsset asset, XmlNode node, GameDefinition game,
			string trace, ref int position, out string ErrorDescription)
		{
			BinaryAsset texture = new BinaryAsset(0);
			string file = null;
			foreach (XmlAttribute attribute in node.Attributes)
			{
				switch (attribute.Name)
				{
					case "File":
						file = attribute.Value;
						break;
					case "Type":
						string[] enumValueNames = typeof(TextureType).GetEnumNames();
						for (int idx = 0; idx < enumValueNames.Length; ++idx)
						{
							if (enumValueNames[idx] == attribute.Value)
							{
								FileHelper.SetInt(idx, 0x04, asset.Content);
							}
						}
						break;
				}
			}
			if (file == null)
			{
				ErrorDescription = string.Format("No file set for {0}", trace);
				return false;
			}
			Uri fileUri = Macro.Parse(file);
			if (!fileUri.IsAbsoluteUri)
			{
				fileUri = new Uri(baseUri, fileUri);
			}
			file = fileUri.LocalPath;
			if (!File.Exists(file))
			{
				ErrorDescription = string.Format("File not found for {0}", trace);
				return false;
			}
			using (FileStream textureStream = new FileStream(file, FileMode.Open, FileAccess.Read, FileShare.Read))
			{
				using (BinaryReader textureReader = new BinaryReader(textureStream))
				{
					texture.Content = textureReader.ReadBytes((int)(textureStream.Length));
				}
			}
			asset.CData = new BinaryAsset(8);
			asset.CData.SubAssets.Add(0, texture);
			FileHelper.SetInt(texture.Content.Length, 0x04, asset.CData.Content);
			ErrorDescription = string.Empty;
			return true;
		}
	}
}
