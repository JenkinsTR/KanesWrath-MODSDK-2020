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
		T[,,] ResizeArray<T>(T[,,] original, int xSize, int ySize, int zSize)
		{
			var newArray = new T[xSize, ySize, zSize];
			var xMin = Math.Min(xSize, original.GetLength(0));
			var yMin = Math.Min(ySize, original.GetLength(1));
			var zMin = Math.Min(zSize, original.GetLength(2));
			for (var x = 0; x < xMin; x++)
				for (var y = 0; y < yMin; y++)
					for (var z = 0; z < zMin; z++)
						newArray[x, y, z] = original[x, y, z];
			return newArray;
		}
	
		public override bool Compile(GameAssetType gameAsset, Uri baseUri, BinaryAsset asset, XmlNode node, GameDefinition game,
			string trace, ref int position, out string ErrorDescription)
		{
			List<TerrainTextureTileRuntime> tiles = new List<TerrainTextureTileRuntime>();
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
			uint nextX = 0;
			
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
			
			// fixed height, automatically calculated width
			ushort atlasWidth = 0;
			ushort atlasHeight = 1152;
			/*
			foreach (XmlAttribute attribute in node.Attributes)
			{
				switch (attribute.Name)
				{
					case "AtlasSize":
						atlasSize = ushort.Parse(attribute.Value);
						break;
				}
			}
			*/
			byte[,,] baseContent = new byte[0,atlasHeight,4];
			byte[,,] normalContent = new byte[0,atlasHeight,4];
			uint colWidth = 0;
			
			for (int tileIdx = 0; tileIdx < textureList.Length >> 1; ++tileIdx)
			{
				uint size = textureList[tileIdx, 0].Header.Height;
				colWidth = Math.Max(size + 32, colWidth);
				
				if (positionY + size + 16 > atlasHeight)
				{
					positionY = 16;
					positionX += nextX;
					colWidth = size + 32;
				}
				
				atlasWidth = (ushort)(positionX + colWidth - 16);
				baseContent = ResizeArray<byte>(baseContent, atlasWidth, atlasHeight, 4);
				normalContent = ResizeArray<byte>(normalContent, atlasWidth, atlasHeight, 4);
				
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
						baseContent[(positionX + idx),(positionY + idy),0] = color[tileY * size * 4 + tileX * 4];
						baseContent[(positionX + idx),(positionY + idy),1] = color[tileY * size * 4 + tileX * 4 + 1];
						baseContent[(positionX + idx),(positionY + idy),2] = color[tileY * size * 4 + tileX * 4 + 2];
						baseContent[(positionX + idx),(positionY + idy),3] = color[tileY * size * 4 + tileX * 4 + 3];
						normalContent[(positionX + idx),(positionY + idy),0] = normal[tileY * size * 4 + tileX * 4];
						normalContent[(positionX + idx),(positionY + idy),1] = normal[tileY * size * 4 + tileX * 4 + 1];
						normalContent[(positionX + idx),(positionY + idy),2] = normal[tileY * size * 4 + tileX * 4 + 2];
						normalContent[(positionX + idx),(positionY + idy),3] = normal[tileY * size * 4 + tileX * 4 + 3];
					}
				}
				
				FileHelper.SetUShort((ushort)positionX, 12 * tileIdx + 4, tileList.Content);
				FileHelper.SetUShort((ushort)positionY, 12 * tileIdx + 6, tileList.Content);
				FileHelper.SetUShort((ushort)(positionX + size), 12 * tileIdx + 8, tileList.Content);
				FileHelper.SetUShort((ushort)(positionY + size), 12 * tileIdx + 10, tileList.Content);
				positionY += size + 32;
				nextX = Math.Max(size + 32, nextX);
			}
			
			byte[] baseContentArray = new byte[atlasWidth * atlasHeight * 4];
			byte[] normalContentArray = new byte[atlasWidth * atlasHeight * 4];
			
			for (int h = 0; h < atlasHeight; ++h)
			{
				for (int w = 0; w < atlasWidth; ++w)
				{
					for (int c = 0; c < 4; ++c)
					{
						baseContentArray[(h*atlasWidth*4) + (w*4) + c] = baseContent[w,h,c];
						normalContentArray[(h*atlasWidth*4) + (w*4) + c] = normalContent[w,h,c];
					}
				}
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
				baseAtlas = new DDSFile(atlasWidth, atlasHeight, 5, DDSType.DXT5, baseContentArray);
			}
			else
			{
				baseAtlas = new DDSFile(atlasWidth, atlasHeight, 5, DDSType.DXT1, baseContentArray);
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
				normalAtlas = new DDSFile(atlasWidth, atlasHeight, 5, DDSType.A1R5G5B5, normalContentArray);
			}
			else
			{
				normalAtlas = new DDSFile(atlasWidth, atlasHeight, 5, DDSType.R5G6B5, normalContentArray);
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
