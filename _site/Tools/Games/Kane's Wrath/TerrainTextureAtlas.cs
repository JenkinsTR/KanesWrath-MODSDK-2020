using System;
using System.Collections.Generic;
using System.IO;
using System.Xml;
using DDS;
using Files;
using SAGE;

namespace SAGE.Compiler
{
	using DDSFile = DDS.File;
	using IOFile = System.IO.File;

	class TerrainTextureTileRuntime
	{
		public uint TextureID { get; set; }
		public ushort UpperLeftX { get; set; }
		public ushort UpperLeftY { get; set; }
		public ushort BottomRightX { get; set; }
		public ushort BottomRightY { get; set; }
	}

	public class TerrainTextureAtlas : CompileHandler
	{
		public override bool Compile(GameAssetType gameAsset, Uri baseUri, BinaryAsset asset, XmlNode node, GameDefinition game,
			string trace, ref int position, out string ErrorDescription)
		{
			List<TerrainTextureTileRuntime> tiles = new List<TerrainTextureTileRuntime>();
			int atlasSize = 2048;
			/*foreach (XmlAttribute attribute in node.Attributes)
			{
				switch (attribute.Name)
				{
					case "AtlasSize":
						atlasSize = ushort.Parse(attribute.Value);
						break;
				}
			}*/
			List<XmlNode> nodes = new List<XmlNode>();
			foreach (XmlNode childNode in node.ChildNodes)
			{
				if (childNode.Name == "Tile")
				{
					nodes.Add(childNode);
				}
			}
			FileHelper.SetInt(nodes.Count, 4, asset.Content);
			BinaryAsset tileList = new BinaryAsset(12 * nodes.Count);
			asset.SubAssets.Add(8, tileList);
			DDSFile[,] textureList = new DDSFile[nodes.Count, 2];
			BinaryAsset baseAsset = new BinaryAsset(0);
			BinaryAsset normalAsset = new BinaryAsset(0);
			uint positionX = 16;
			uint positionY = 16;
			uint nextY = 0;
			for (int idx = 0; idx < nodes.Count; ++idx)
			{
				FileHelper.SetUInt(uint.Parse(nodes[idx].Attributes["TextureID"].Value), idx * 12, tileList.Content);
				string baseTexture = nodes[idx].Attributes["BaseTexture"].Value;
				baseTexture = baseTexture.Substring(baseTexture.LastIndexOf(Path.DirectorySeparatorChar) + 1);
				baseTexture = baseTexture.Substring(baseTexture.LastIndexOf('/') + 1);
				baseTexture = baseTexture.Substring(0, baseTexture.LastIndexOf('.'));
				string baseTexturePath = Macro.Terrain + baseTexture + ".dds";
				if (!IOFile.Exists(baseTexturePath))
				{
					ErrorDescription = string.Format("{0} doesn't exist.", baseTexturePath);
					return false;
				}
				using (FileStream textureStream = new FileStream(baseTexturePath, FileMode.Open, FileAccess.Read, FileShare.Read))
				{
					using (BinaryReader textureReader = new BinaryReader(textureStream))
					{
						textureList[idx, 0] = new DDSFile(textureReader.ReadBytes((int)(textureStream.Length)));
					}
				}
				string normalTexture = nodes[idx].Attributes["NormalTexture"].Value;
				normalTexture = normalTexture.Substring(normalTexture.LastIndexOf(Path.DirectorySeparatorChar) + 1);
				normalTexture = normalTexture.Substring(normalTexture.LastIndexOf('/') + 1);
				normalTexture = normalTexture.Substring(0, normalTexture.LastIndexOf('.'));
				string normalTexturePath = Macro.Terrain + normalTexture + ".dds";
				if (!IOFile.Exists(normalTexturePath))
				{
					ErrorDescription = string.Format("{0} doesn't exist.", normalTexturePath);
					return false;
				}
				using (FileStream textureStream = new FileStream(normalTexturePath, FileMode.Open, FileAccess.Read, FileShare.Read))
				{
					using (BinaryReader textureReader = new BinaryReader(textureStream))
					{
						textureList[idx, 1] = new DDSFile(textureReader.ReadBytes((int)(textureStream.Length)));
					}
				}
			}
			// For now assume each texture has the same size.
			atlasSize = (int)textureList[0, 0].Header.Width + 32;
			atlasSize *= atlasSize * (textureList.Length >> 1);
			atlasSize = (int)Math.Sqrt((double)atlasSize);
			--atlasSize;
			atlasSize |= atlasSize >> 1;
			atlasSize |= atlasSize >> 2;
			atlasSize |= atlasSize >> 4;
			atlasSize |= atlasSize >> 8;
			++atlasSize;
			byte[] baseContent = new byte[atlasSize * atlasSize * 4];
			byte[] normalContent = new byte[atlasSize * atlasSize * 4];
			for (int tileIdx = 0; tileIdx < textureList.Length >> 1; ++tileIdx)
			{
				uint size = textureList[tileIdx, 0].Header.Width;
				if (positionX + size + 16 > atlasSize)
				{
					positionX = 16;
					positionY += nextY;
				}
				byte[] color = textureList[tileIdx, 0].Content.GetColor(size, size);
				byte[] normal = textureList[tileIdx, 1].Content.GetColor(size, size);
				for (int idy = -16; idy < size + 16; ++idy)
				{
					for (int idx = -16; idx < size + 16; ++idx)
					{
						int tileY = idy;
						if (tileY < 0)
						{
							tileY = (int)(size + tileY);
						}
						else if (tileY >= size)
						{
							tileY = (int)(tileY - size);
						}
						int tileX = idx;
						if (tileX < 0)
						{
							tileX = (int)(size + tileX);
						}
						else if (tileX >= size)
						{
							tileX = (int)(tileX - size);
						}
						baseContent[(positionY + idy) * atlasSize * 4 + (positionX + idx) * 4] = color[tileY * size * 4 + tileX * 4];
						baseContent[(positionY + idy) * atlasSize * 4 + (positionX + idx) * 4 + 1] = color[tileY * size * 4 + tileX * 4 + 1];
						baseContent[(positionY + idy) * atlasSize * 4 + (positionX + idx) * 4 + 2] = color[tileY * size * 4 + tileX * 4 + 2];
						baseContent[(positionY + idy) * atlasSize * 4 + (positionX + idx) * 4 + 3] = color[tileY * size * 4 + tileX * 4 + 3];
						normalContent[(positionY + idy) * atlasSize * 4 + (positionX + idx) * 4] = normal[tileY * size * 4 + tileX * 4];
						normalContent[(positionY + idy) * atlasSize * 4 + (positionX + idx) * 4 + 1] = normal[tileY * size * 4 + tileX * 4 + 1];
						normalContent[(positionY + idy) * atlasSize * 4 + (positionX + idx) * 4 + 2] = normal[tileY * size * 4 + tileX * 4 + 2];
						normalContent[(positionY + idy) * atlasSize * 4 + (positionX + idx) * 4 + 3] = normal[tileY * size * 4 + tileX * 4 + 3];
					}
				}
				FileHelper.SetUShort((ushort)positionX, 12 * tileIdx + 4, tileList.Content);
				FileHelper.SetUShort((ushort)positionY, 12 * tileIdx + 6, tileList.Content);
				FileHelper.SetUShort((ushort)(positionX + size), 12 * tileIdx + 8, tileList.Content);
				FileHelper.SetUShort((ushort)(positionY + size), 12 * tileIdx + 10, tileList.Content);
				positionX += size + 32;
				nextY = Math.Max(size + 32, nextY);
			}
			bool hasAlpha = false;
			for (int idx = 0; idx < nodes.Count; ++idx)
			{
				if (textureList[idx, 0].HasAlpha())
				{
					hasAlpha = true;
					break;
				}
			}
			DDSFile baseAtlas = null;
			if (hasAlpha)
			{
				baseAtlas = new DDSFile((uint)atlasSize, (uint)atlasSize, 5, DDSType.DXT5, baseContent);
			}
			else
			{
				baseAtlas = new DDSFile((uint)atlasSize, (uint)atlasSize, 5, DDSType.DXT1, baseContent);
			}
			hasAlpha = false;
			for (int idx = 0; idx < nodes.Count; ++idx)
			{
				if (textureList[idx, 1].HasAlpha())
				{
					hasAlpha = true;
					break;
				}
			}
			DDSFile normalAtlas = null;
			if (hasAlpha)
			{
				normalAtlas = new DDSFile((uint)atlasSize, (uint)atlasSize, 5, DDSType.A1R5G5B5, normalContent, true);
			}
			else
			{
				normalAtlas = new DDSFile((uint)atlasSize, (uint)atlasSize, 5, DDSType.R5G5B5, normalContent, true);
			}
			baseAsset.Content = baseAtlas.Binary;
			asset.SubAssets.Add(0x0C, baseAsset);
			FileHelper.SetInt(baseAsset.Content.Length, 0x10, asset.Content);
			normalAsset.Content = normalAtlas.Binary;
			asset.SubAssets.Add(0x14, normalAsset);
			FileHelper.SetInt(normalAsset.Content.Length, 0x18, asset.Content);
			ErrorDescription = string.Empty;
			return true;
		}
	}
}
