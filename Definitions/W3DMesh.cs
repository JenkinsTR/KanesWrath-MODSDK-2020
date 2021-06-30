using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Xml;
using Files;
using SAGE;

namespace SAGE.Compiler
{
	class Vector2
	{
		public byte[] binary;

		public float X
		{
			get
			{
				return FileHelper.GetFloat(0x00, binary);
			}
			set
			{
				FileHelper.SetFloat(value, 0x00, binary);
			}
		}

		public float Y
		{
			get
			{
				return FileHelper.GetFloat(0x04, binary);
			}
			set
			{
				FileHelper.SetFloat(value, 0x04, binary);
			}
		}

		public Vector2()
		{
			binary = new byte[8];
		}
	}

	class Vector3
	{
		public byte[] binary;

		public float X
		{
			get
			{
				return FileHelper.GetFloat(0x00, binary);
			}
			set
			{
				FileHelper.SetFloat(value, 0x00, binary);
			}
		}

		public float Y
		{
			get
			{
				return FileHelper.GetFloat(0x04, binary);
			}
			set
			{
				FileHelper.SetFloat(value, 0x04, binary);
			}
		}

		public float Z
		{
			get
			{
				return FileHelper.GetFloat(0x08, binary);
			}
			set
			{
				FileHelper.SetFloat(value, 0x08, binary);
			}
		}

		public Vector3()
		{
			binary = new byte[12];
		}
	}

	class RGBAColor
	{
		public byte[] binary;

		public byte R
		{
			get
			{
				return FileHelper.GetByte(0x00, binary);
			}
			set
			{
				FileHelper.SetByte(value, 0x00, binary);
			}
		}

		public byte G
		{
			get
			{
				return FileHelper.GetByte(0x01, binary);
			}
			set
			{
				FileHelper.SetByte(value, 0x01, binary);
			}
		}

		public byte B
		{
			get
			{
				return FileHelper.GetByte(0x02, binary);
			}
			set
			{
				FileHelper.SetByte(value, 0x02, binary);
			}
		}

		public byte A
		{
			get
			{
				return FileHelper.GetByte(0x03, binary);
			}
			set
			{
				FileHelper.SetByte(value, 0x03, binary);
			}
		}

		public RGBAColor()
		{
			binary = new byte[4];
		}
	}

	class BoneInfluence
	{
		public RGBAColor Bones;
		public Vector2 Influences;

		public BoneInfluence()
		{
			Bones = new RGBAColor();
			Influences = new Vector2();
		}
	}

	class VertexData
	{
		public List<Vector3>[] Vertices;
		public int VerticesCount;
		public List<Vector3>[] Normals;
		public int NormalsCount;
		public List<Vector3> Tangents;
		public int TangentsCount;
		public List<Vector3> Binormals;
		public int BinormalsCount;
		public List<RGBAColor> VertexColors;
		public List<List<Vector2>> TexCoords;
		public List<BoneInfluence> BoneInfluences;
		public int BoneInfluencesCount;

		public VertexData()
		{
			Vertices = new List<Vector3>[2];
			Normals = new List<Vector3>[2];
			TexCoords = new List<List<Vector2>>();
		}
	}

	enum VertexElementType : byte
	{
		FLOAT1 = 0,
		FLOAT2,
		FLOAT3,
		FLOAT4,
		D3DCOLOR,
		UBYTE4,
		SHORT2,
		SHORT4,
		UBYTE4N,
		SHORT2N,
		SHORT4N,
		USHORT2N,
		USHORT4N,
		UDEC3,
		DEC3N,
		FLOAT16_2,
		FLOAT16_4,
		UNUSED
	}

	enum VertexElementMethod : byte
	{
		DEFAULT = 0,
		PARTIALU,
		PARTIALV,
		CROSSUV,
		UV,
		LOOKUP,
		LOOKUPPRESAMPLED
	}

	enum VertexElementUsage : byte
	{
		POSITION = 0,
		BLENDWEIGHT,
		BLENDINDICES,
		NORMAL,
		PSIZE,
		TEXCOORD,
		TANGENT,
		BINORMAL,
		TESSFACTOR,
		POSITIONT,
		COLOR,
		FOG,
		DEPTH,
		SAMPLE
	}

	class VertexElement
	{
		public byte[] binary;

		public short Stream
		{
			get
			{
				return FileHelper.GetShort(0x00, binary);
			}
			set
			{
				FileHelper.SetShort(value, 0x00, binary);
			}
		}

		public short Offset
		{
			get
			{
				return FileHelper.GetShort(0x02, binary);
			}
			set
			{
				FileHelper.SetShort(value, 0x02, binary);
			}
		}

		public VertexElementType Type
		{
			get
			{
				return (VertexElementType)FileHelper.GetByte(0x04, binary);
			}
			set
			{
				FileHelper.SetByte((byte)value, 0x04, binary);
			}
		}

		public VertexElementMethod Method
		{
			get
			{
				return (VertexElementMethod)FileHelper.GetByte(0x05, binary);
			}
			set
			{
				FileHelper.SetByte((byte)value, 0x05, binary);
			}
		}

		public VertexElementUsage Usage
		{
			get
			{
				return (VertexElementUsage)FileHelper.GetByte(0x06, binary);
			}
			set
			{
				FileHelper.SetByte((byte)value, 0x06, binary);
			}
		}

		public byte UsageIndex
		{
			get
			{
				return FileHelper.GetByte(0x07, binary);
			}
			set
			{
				FileHelper.SetByte(value, 0x07, binary);
			}
		}

		public VertexElement()
		{
			binary = new byte[8];
		}

		public VertexElement(bool isEmpty)
		{
			binary = new byte[8];
			Stream = 255;
			Type = VertexElementType.UNUSED;
		}
	}

	public class W3DMesh : CompileHandler
	{
		public override bool Compile(GameAssetType gameAsset, Uri baseUri, BinaryAsset asset, XmlNode node, GameDefinition game,
			string trace, ref int position, out string ErrorDescription)
		{
			BinaryAsset w3dMeshPipelineVertexData = new BinaryAsset(0x1C);
			asset.SubAssets.Add(position, w3dMeshPipelineVertexData);
			position += 4;
			VertexData vertexData = new VertexData();
			List<ushort> bones = new List<ushort>();
			foreach (XmlNode childNode in node.ChildNodes)
			{
				switch (childNode.Name)
				{
					case "Vertices":
						++vertexData.VerticesCount;
						List<Vector3> verticesList = new List<Vector3>();
						if (vertexData.Vertices[0] == null)
						{
							vertexData.Vertices[0] = verticesList;
						}
						else
						{
							vertexData.Vertices[1] = verticesList;
						}
						foreach (XmlNode vertexNode in childNode.ChildNodes)
						{
							if (vertexNode.Name == "V")
							{
								Vector3 vertex = new Vector3();
								vertex.X = float.Parse(vertexNode.Attributes.GetNamedItem("X").Value, NumberFormatInfo.InvariantInfo);
								vertex.Y = float.Parse(vertexNode.Attributes.GetNamedItem("Y").Value, NumberFormatInfo.InvariantInfo);
								vertex.Z = float.Parse(vertexNode.Attributes.GetNamedItem("Z").Value, NumberFormatInfo.InvariantInfo);
								verticesList.Add(vertex);
							}
						}
						break;
					case "Normals":
						++vertexData.NormalsCount;
						List<Vector3> normalsList = new List<Vector3>();
						if (vertexData.Normals[0] == null)
						{
							vertexData.Normals[0] = normalsList;
						}
						else
						{
							vertexData.Normals[1] = normalsList;
						}
						foreach (XmlNode normalNode in childNode.ChildNodes)
						{
							if (normalNode.Name == "N")
							{
								Vector3 normal = new Vector3();
								normal.X = float.Parse(normalNode.Attributes.GetNamedItem("X").Value, NumberFormatInfo.InvariantInfo);
								normal.Y = float.Parse(normalNode.Attributes.GetNamedItem("Y").Value, NumberFormatInfo.InvariantInfo);
								normal.Z = float.Parse(normalNode.Attributes.GetNamedItem("Z").Value, NumberFormatInfo.InvariantInfo);
								normalsList.Add(normal);
							}
						}
						break;
					case "Tangents":
						++vertexData.TangentsCount;
						List<Vector3> tangentsList = new List<Vector3>();
						vertexData.Tangents = tangentsList;
						foreach (XmlNode tangentNode in childNode.ChildNodes)
						{
							if (tangentNode.Name == "T")
							{
								Vector3 tangent = new Vector3();
								tangent.X = float.Parse(tangentNode.Attributes.GetNamedItem("X").Value, NumberFormatInfo.InvariantInfo);
								tangent.Y = float.Parse(tangentNode.Attributes.GetNamedItem("Y").Value, NumberFormatInfo.InvariantInfo);
								tangent.Z = float.Parse(tangentNode.Attributes.GetNamedItem("Z").Value, NumberFormatInfo.InvariantInfo);
								tangentsList.Add(tangent);
							}
						}
						break;
					case "Binormals":
						++vertexData.BinormalsCount;
						List<Vector3> binormalsList = new List<Vector3>();
						vertexData.Binormals = binormalsList;
						foreach (XmlNode binormalNode in childNode.ChildNodes)
						{
							if (binormalNode.Name == "B")
							{
								Vector3 binormal = new Vector3();
								binormal.X = float.Parse(binormalNode.Attributes.GetNamedItem("X").Value, NumberFormatInfo.InvariantInfo);
								binormal.Y = float.Parse(binormalNode.Attributes.GetNamedItem("Y").Value, NumberFormatInfo.InvariantInfo);
								binormal.Z = float.Parse(binormalNode.Attributes.GetNamedItem("Z").Value, NumberFormatInfo.InvariantInfo);
								binormalsList.Add(binormal);
							}
						}
						break;
					case "VertexColors":
						List<RGBAColor> colorList = new List<RGBAColor>();
						vertexData.VertexColors = colorList;
						foreach (XmlNode colorNode in childNode.ChildNodes)
						{
							if (colorNode.Name == "C")
							{
								RGBAColor color = new RGBAColor();
								color.R = (byte)(float.Parse(colorNode.Attributes.GetNamedItem("B").Value, NumberFormatInfo.InvariantInfo) * 255);
								color.G = (byte)(float.Parse(colorNode.Attributes.GetNamedItem("G").Value, NumberFormatInfo.InvariantInfo) * 255);
								color.B = (byte)(float.Parse(colorNode.Attributes.GetNamedItem("R").Value, NumberFormatInfo.InvariantInfo) * 255);
								color.A = (byte)(float.Parse(colorNode.Attributes.GetNamedItem("A").Value, NumberFormatInfo.InvariantInfo) * 255);
								colorList.Add(color);
							}
						}
						break;
					case "TexCoords":
						List<Vector2> texcoordsList = new List<Vector2>();
						vertexData.TexCoords.Add(texcoordsList);
						foreach (XmlNode texcoordNode in childNode.ChildNodes)
						{
							if (texcoordNode.Name == "T")
							{
								Vector2 texcoord = new Vector2();
								texcoord.X = float.Parse(texcoordNode.Attributes.GetNamedItem("X").Value, NumberFormatInfo.InvariantInfo);
								texcoord.Y = 1 - float.Parse(texcoordNode.Attributes.GetNamedItem("Y").Value, NumberFormatInfo.InvariantInfo);
								texcoordsList.Add(texcoord);
							}
						}
						break;
					case "BoneInfluences":
						++vertexData.BoneInfluencesCount;
						if (vertexData.BoneInfluences == null)
						{
							List<BoneInfluence> boneinfluenceList = new List<BoneInfluence>();
							vertexData.BoneInfluences = boneinfluenceList;
							foreach (XmlNode boneinfluenceNode in childNode.ChildNodes)
							{
								if (boneinfluenceNode.Name == "I")
								{
									BoneInfluence boneinfluence = new BoneInfluence();
									ushort bone = ushort.Parse(boneinfluenceNode.Attributes.GetNamedItem("Bone").Value);
									if (bones.Contains(bone))
									{
										boneinfluence.Bones.R = (byte)bones.IndexOf(bone);
									}
									else
									{
										boneinfluence.Bones.R = (byte)bones.Count;
										bones.Add(bone);
									}
									boneinfluence.Influences.X = float.Parse(boneinfluenceNode.Attributes.GetNamedItem("Weight").Value, NumberFormatInfo.InvariantInfo);
									boneinfluenceList.Add(boneinfluence);
								}
							}
						}
						else
						{
							List<BoneInfluence> boneinfluenceList = vertexData.BoneInfluences;
							int idx = 0;
							foreach (XmlNode boneinfluenceNode in childNode.ChildNodes)
							{
								if (boneinfluenceNode.Name == "I")
								{
									ushort bone = ushort.Parse(boneinfluenceNode.Attributes.GetNamedItem("Bone").Value);
									if (bones.Contains(bone))
									{
										boneinfluenceList[idx].Bones.G = (byte)bones.IndexOf(bone);
									}
									else
									{
										boneinfluenceList[idx].Bones.G = (byte)bones.Count;
										bones.Add(bone);
									}
									boneinfluenceList[idx].Influences.Y = float.Parse(boneinfluenceNode.Attributes.GetNamedItem("Weight").Value, NumberFormatInfo.InvariantInfo);
									++idx;
								}
							}
						}
						break;
					case "ShadeIndices":
						// unused
						break;
				}
			}
			FileHelper.SetInt(vertexData.Vertices[0].Count, 0x00, w3dMeshPipelineVertexData.Content);
			List<VertexElement> vertexElements = new List<VertexElement>();
			short vertexSize = 0;
			for (byte idx = 0; idx < vertexData.VerticesCount; ++idx)
			{
				VertexElement vertexElement = new VertexElement();
				vertexElement.Offset = vertexSize;
				vertexElement.Type = VertexElementType.FLOAT3;
				vertexElement.Method = VertexElementMethod.DEFAULT;
				vertexElement.Usage = VertexElementUsage.POSITION;
				vertexElement.UsageIndex = idx;
				vertexElements.Add(vertexElement);
				vertexSize += 12;
			}
			for (byte idx = 0; idx < vertexData.NormalsCount; ++idx)
			{
				VertexElement vertexElement = new VertexElement();
				vertexElement.Offset = vertexSize;
				vertexElement.Type = VertexElementType.FLOAT3;
				vertexElement.Method = VertexElementMethod.DEFAULT;
				vertexElement.Usage = VertexElementUsage.NORMAL;
				vertexElement.UsageIndex = idx;
				vertexElements.Add(vertexElement);
				vertexSize += 12;
			}
			VertexElement colorvertexElement = new VertexElement();
			colorvertexElement.Offset = vertexSize;
			colorvertexElement.Type = VertexElementType.D3DCOLOR;
			colorvertexElement.Method = VertexElementMethod.DEFAULT;
			colorvertexElement.Usage = VertexElementUsage.COLOR;
			colorvertexElement.UsageIndex = 0;
			vertexElements.Add(colorvertexElement);
			vertexSize += 4;
			for (byte idx = 0; idx < vertexData.TangentsCount; ++idx)
			{
				VertexElement vertexElement = new VertexElement();
				vertexElement.Offset = vertexSize;
				vertexElement.Type = VertexElementType.FLOAT3;
				vertexElement.Method = VertexElementMethod.DEFAULT;
				vertexElement.Usage = VertexElementUsage.TANGENT;
				vertexElement.UsageIndex = idx;
				vertexElements.Add(vertexElement);
				vertexSize += 12;
			}
			for (byte idx = 0; idx < vertexData.BinormalsCount; ++idx)
			{
				VertexElement vertexElement = new VertexElement();
				vertexElement.Offset = vertexSize;
				vertexElement.Type = VertexElementType.FLOAT3;
				vertexElement.Method = VertexElementMethod.DEFAULT;
				vertexElement.Usage = VertexElementUsage.BINORMAL;
				vertexElement.UsageIndex = idx;
				vertexElements.Add(vertexElement);
				vertexSize += 12;
			}
			for (byte idx = 0; idx < vertexData.TexCoords.Count; ++idx)
			{
				VertexElement vertexElement = new VertexElement();
				vertexElement.Offset = vertexSize;
				vertexElement.Type = VertexElementType.FLOAT2;
				vertexElement.Method = VertexElementMethod.DEFAULT;
				vertexElement.Usage = VertexElementUsage.TEXCOORD;
				vertexElement.UsageIndex = idx;
				vertexElements.Add(vertexElement);
				vertexSize += 8;
			}
			if (vertexData.BoneInfluencesCount != 0)
			{
				VertexElement vertexElement = new VertexElement();
				vertexElement.Offset = vertexSize;
				vertexElement.Type = VertexElementType.D3DCOLOR;
				vertexElement.Method = VertexElementMethod.DEFAULT;
				vertexElement.Usage = VertexElementUsage.BLENDINDICES;
				vertexElement.UsageIndex = 0;
				vertexElements.Add(vertexElement);
				vertexSize += 4;
				foreach (BoneInfluence influence in vertexData.BoneInfluences)
				{
					if (influence.Influences.X != 1
						|| (vertexData.BoneInfluencesCount == 2 && influence.Influences.Y != 1))
					{
						VertexElement influenceVertexElement = new VertexElement();
						influenceVertexElement.Offset = vertexSize;
						influenceVertexElement.Type = VertexElementType.FLOAT2;
						influenceVertexElement.Method = VertexElementMethod.DEFAULT;
						influenceVertexElement.Usage = VertexElementUsage.BLENDWEIGHT;
						influenceVertexElement.UsageIndex = 0;
						vertexElements.Add(influenceVertexElement);
						vertexSize += 8;
						break;
					}
				}
			}
			vertexElements.Add(new VertexElement(true));
			FileHelper.SetInt(vertexSize, 0x04, w3dMeshPipelineVertexData.Content);
			BinaryAsset binaryVertexData = new BinaryAsset(vertexData.Vertices[0].Count * vertexSize);
			w3dMeshPipelineVertexData.SubAssets.Add(0x08, binaryVertexData);
			FileHelper.SetInt(vertexElements.Count << 3, 0x0C, w3dMeshPipelineVertexData.Content);
			BinaryAsset binaryVertexElementData = new BinaryAsset(vertexElements.Count << 3);
			w3dMeshPipelineVertexData.SubAssets.Add(0x10, binaryVertexElementData);
			for (int idx = 0; idx < vertexElements.Count; ++idx)
			{
				VertexElement vertexElement = vertexElements[idx];
				switch (vertexElement.Usage)
				{
					case VertexElementUsage.POSITION:
						List<Vector3> verticesList = vertexData.Vertices[vertexElement.UsageIndex];
						for (int idy = 0; idy < verticesList.Count; ++idy)
						{
							Array.Copy(verticesList[idy].binary, 0, binaryVertexData.Content, idy * vertexSize + vertexElement.Offset, 12);
						}
						break;
					case VertexElementUsage.NORMAL:
						List<Vector3> normalsList = vertexData.Normals[vertexElement.UsageIndex];
						for (int idy = 0; idy < normalsList.Count; ++idy)
						{
							Array.Copy(normalsList[idy].binary, 0, binaryVertexData.Content, idy * vertexSize + vertexElement.Offset, 12);
						}
						break;
					case VertexElementUsage.TANGENT:
						List<Vector3> tangentsList = vertexData.Tangents;
						for (int idy = 0; idy < tangentsList.Count; ++idy)
						{
							Array.Copy(tangentsList[idy].binary, 0, binaryVertexData.Content, idy * vertexSize + vertexElement.Offset, 12);
						}
						break;
					case VertexElementUsage.BINORMAL:
						List<Vector3> binormalsList = vertexData.Binormals;
						for (int idy = 0; idy < binormalsList.Count; ++idy)
						{
							Array.Copy(binormalsList[idy].binary, 0, binaryVertexData.Content, idy * vertexSize + vertexElement.Offset, 12);
						}
						break;
					case VertexElementUsage.COLOR:
						List<RGBAColor> colorsList = vertexData.VertexColors;
						if (colorsList != null)
						{
							for (int idy = 0; idy < colorsList.Count; ++idy)
							{
								Array.Copy(colorsList[idy].binary, 0, binaryVertexData.Content, idy * vertexSize + vertexElement.Offset, 4);
							}
						}
						else
						{
							int vertexCount = vertexData.Vertices[0].Count;
							for (int idy = 0; idy < vertexCount; ++idy)
							{
								FileHelper.SetInt(-1, idy * vertexSize + vertexElement.Offset, binaryVertexData.Content);
							}
						}
						break;
					case VertexElementUsage.TEXCOORD:
						List<Vector2> texcoordList = vertexData.TexCoords[vertexElement.UsageIndex];
						for (int idy = 0; idy < texcoordList.Count; ++idy)
						{
							Array.Copy(texcoordList[idy].binary, 0, binaryVertexData.Content, idy * vertexSize + vertexElement.Offset, 8);
						}
						break;
					case VertexElementUsage.BLENDINDICES:
						List<BoneInfluence> blendindicesList = vertexData.BoneInfluences;
						for (int idy = 0; idy < blendindicesList.Count; ++idy)
						{
							Array.Copy(blendindicesList[idy].Bones.binary, 0, binaryVertexData.Content, idy * vertexSize + vertexElement.Offset, 4);
						}
						break;
					case VertexElementUsage.BLENDWEIGHT:
						List<BoneInfluence> blendweightList = vertexData.BoneInfluences;
						for (int idy = 0; idy < blendweightList.Count; ++idy)
						{
							Array.Copy(blendweightList[idy].Influences.binary, 0, binaryVertexData.Content, idy * vertexSize + vertexElement.Offset, 8);
						}
						break;
				}
				Array.Copy(vertexElement.binary, 0, binaryVertexElementData.Content, idx << 3, 8);
			}
			BinaryAsset boneList = null;
			int sageUnsignedShortCount = 2 - (bones.Count & 1);
			if (sageUnsignedShortCount == 2)
			{
				boneList = new BinaryAsset(bones.Count * 2);
			}
			else
			{
				boneList = new BinaryAsset((bones.Count + sageUnsignedShortCount) * 2);
			}
			for (int idx = 0; idx < bones.Count; ++idx)
			{
				FileHelper.SetUShort(bones[idx], idx * 2, boneList.Content);
			}
			FileHelper.SetInt(bones.Count, 0x14, w3dMeshPipelineVertexData.Content);
			w3dMeshPipelineVertexData.SubAssets.Add(0x18, boneList);
			foreach (BaseEntryType entry in gameAsset.Runtime.Entries)
			{
				if (entry.id == "VertexData")
				{
					continue;
				}
				if (!entry.Compile(baseUri, asset, node, game, "W3DMesh", ref position, out ErrorDescription))
				{
					return false;
				}
			}
			ErrorDescription = string.Empty;
			return true;
		}
	}
}
