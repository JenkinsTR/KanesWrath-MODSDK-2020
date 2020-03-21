using System;
using System.Collections.Generic;
using System.IO;
using System.Xml;
using Files;
using SAGE;

namespace SAGE.Compiler
{
	public class Texture : CompileHandler
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
			asset.SubAssets.Add(0x04, texture);
			FileHelper.SetInt(texture.Content.Length, 0x08, asset.Content);
			ErrorDescription = string.Empty;
			return true;
		}
	}
}
