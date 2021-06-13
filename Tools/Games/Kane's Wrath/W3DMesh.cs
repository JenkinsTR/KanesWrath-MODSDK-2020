using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Runtime.InteropServices;
using System.Xml;
using Files;
using SAGE;
using SAGE.Stream;

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

	public unsafe class W3DMesh : CompileHandler
    {
        [StructLayout(LayoutKind.Sequential, Pack = 4)]
        private struct SVector2
        {
            public float X;
            public float Y;
        }

        [StructLayout(LayoutKind.Sequential, Pack = 4)]
        private struct SVector3
        {
            public float X;
            public float Y;
            public float Z;
        }

        [StructLayout(LayoutKind.Sequential, Pack = 4)]
        private struct SRGBAColor
        {
            public byte R;
            public byte G;
            public byte B;
            public byte A;
        }

        [StructLayout(LayoutKind.Sequential, Pack = 4)]
        private struct BoxMinMax
        {
            public SVector3 Min;
            public SVector3 Max;
        }

        [StructLayout(LayoutKind.Sequential, Pack = 4)]
        private struct Sphere
        {
            public float Radius;
            public SVector3 Center;
        }

        [StructLayout(LayoutKind.Sequential, Pack = 4)]
        private struct Triangle
        {
            public int VLength;
            public int VOffset;
            public SVector3 Nrm;
            public float Dist;
        }

        [StructLayout(LayoutKind.Sequential, Pack = 4)]
        private struct FXShaderMaterial
        {
            public int ShaderNameLength;
            public int ShaderNameOffset;
            public int TechniqueNameLength;
            public int TechniqueNameOffset;
            public int ConstantsLength;
            public int ConstantsOffset;
            public byte TechniqueIndex;
        }
        
        [StructLayout(LayoutKind.Sequential, Pack = 4)]
        private struct AABTree
        {
            public int PolyIndicesLength;
            public int PolyIndicesOffset;
            public int NodeLength;
            public int NodeOffset;
        }

        private enum MeshGeometryType
        {
            Normal,
            Skin,
            CameraAligned,
            CameraOriented
        }

        private enum ConstantType : uint
        {
            FXShaderConstantTexture = 0xA59096A6u,
            FXShaderConstantFloat = 0xDF08DF25u,
            FXShaderConstantInt = 0x89181982u,
            FXShaderConstantBool = 0xA3F84C3Du
        }

        [StructLayout(LayoutKind.Sequential, Pack = 4)]
        private struct W3DMeshPipelineVertexData
        {
            public int VertexCount;
            public int VertexSize;
            public int VertexOffset;
            public int VertexElementsSize;
            public int VertexElementsOffset;
            public int BonesSize;
            public int BonesOffset;
        }

        [StructLayout(LayoutKind.Sequential, Pack = 4)]
        private struct SVertexElement
        {
            public short Stream;
            public short Offset;
            public VertexElementType Type;
            public VertexElementMethod Method;
            public VertexElementUsage Usage;
            public byte UsageIndex;
        }

        private const string _xmlNameSpace = "uri:ea.com:eala:asset";

        private VertexData GetVertexData(byte* fpBin, byte* pBin)
        {
            W3DMeshPipelineVertexData w3dVertexData = *(W3DMeshPipelineVertexData*)pBin;
            byte* vertexData = fpBin + w3dVertexData.VertexOffset;
            SVertexElement* vertexElements = (SVertexElement*)(fpBin + w3dVertexData.VertexElementsOffset);
            int vertexElementsLength = w3dVertexData.VertexElementsSize >> 3;
            VertexData result = new VertexData();
            SVector2* vector2;
            SVector3* vector3;
            SRGBAColor* color;
            BoneInfluence boneInfluence = null;
            for (int idx = 0; idx < w3dVertexData.VertexCount; ++idx)
            {
                for (int idy = 0; idy < vertexElementsLength; ++idy)
                {
                    SVertexElement* vertexElement = &vertexElements[idy];
                    if (vertexElement->Type == VertexElementType.UNUSED)
                    {
                        continue;
                    }
                    switch (vertexElement->Usage)
                    {
                        case VertexElementUsage.POSITION:
                            List<Vector3> v = result.Vertices[vertexElement->UsageIndex];
                            if (v == null)
                            {
                                v = result.Vertices[vertexElement->UsageIndex] = new List<Vector3>();
                                ++result.VerticesCount;
                            }
                            vector3 = (SVector3*)vertexData;
                            vertexData += 12;
                            v.Add(new Vector3() { X = vector3->X, Y = vector3->Y, Z = vector3->Z });
                            break;
                        case VertexElementUsage.NORMAL:
                            List<Vector3> n = result.Normals[vertexElement->UsageIndex];
                            if (n == null)
                            {
                                n = result.Normals[vertexElement->UsageIndex] = new List<Vector3>();
                                ++result.NormalsCount;
                            }
                            vector3 = (SVector3*)vertexData;
                            vertexData += 12;
                            n.Add(new Vector3() { X = vector3->X, Y = vector3->Y, Z = vector3->Z });
                            break;
                        case VertexElementUsage.COLOR:
                            List<RGBAColor> c = result.VertexColors;
                            if (c == null)
                            {
                                c = result.VertexColors = new List<RGBAColor>();
                            }
                            color = (SRGBAColor*)vertexData;
                            vertexData += 4;
                            c.Add(new RGBAColor() { R = color->R, G = color->G, B = color->B, A = color->A });
                            break;
                        case VertexElementUsage.TANGENT:
                            List<Vector3> t = result.Tangents;
                            if (t == null)
                            {
                                t = result.Tangents = new List<Vector3>();
                                ++result.TangentsCount;
                            }
                            vector3 = (SVector3*)vertexData;
                            vertexData += 12;
                            t.Add(new Vector3() { X = vector3->X, Y = vector3->Y, Z = vector3->Z });
                            break;
                        case VertexElementUsage.BINORMAL:
                            List<Vector3> b = result.Binormals;
                            if (b == null)
                            {
                                b = result.Binormals = new List<Vector3>();
                                ++result.BinormalsCount;
                            }
                            vector3 = (SVector3*)vertexData;
                            vertexData += 12;
                            b.Add(new Vector3() { X = vector3->X, Y = vector3->Y, Z = vector3->Z });
                            break;
                        case VertexElementUsage.TEXCOORD:
                            if (result.TexCoords.Count < vertexElement->UsageIndex + 1)
                            {
                                result.TexCoords.Add(new List<Vector2>());
                            }
                            List<Vector2> tc = result.TexCoords[vertexElement->UsageIndex];
                            vector2 = (SVector2*)vertexData;
                            vertexData += 8;
                            tc.Add(new Vector2() { X = vector2->X, Y = vector2->Y });
                            break;
                        case VertexElementUsage.BLENDINDICES:
                            List<BoneInfluence> bi = result.BoneInfluences;
                            if (bi == null)
                            {
                                bi = result.BoneInfluences = new List<BoneInfluence>();
                                ++result.BoneInfluencesCount;
                            }
                            color = (SRGBAColor*)vertexData;
                            vertexData += 4;
                            boneInfluence = new BoneInfluence();
                            boneInfluence.Bones.R = color->R;
                            boneInfluence.Bones.G = color->G;
                            boneInfluence.Bones.B = color->B;
                            boneInfluence.Bones.A = color->A;
                            bi.Add(boneInfluence);
                            break;
                        case VertexElementUsage.BLENDWEIGHT:
                            vector2 = (SVector2*)vertexData;
                            vertexData += 8;
                            boneInfluence.Influences.X = vector2->X;
                            boneInfluence.Influences.Y = vector2->Y;
                            break;
                    }
                }
            }
            return result;
        }

        private void WriteRGBAColor(XmlDocument document, XmlNode entryNode, RGBAColor color)
        {
            XmlAttribute attribute = document.CreateAttribute("R");
            attribute.Value = (color.R / 255.0).ToString();
            entryNode.Attributes.Append(attribute);
            attribute = document.CreateAttribute("G");
            attribute.Value = (color.G / 255.0).ToString();
            entryNode.Attributes.Append(attribute);
            attribute = document.CreateAttribute("B");
            attribute.Value = (color.B / 255.0).ToString();
            entryNode.Attributes.Append(attribute);
            attribute = document.CreateAttribute("A");
            attribute.Value = (color.A / 255.0).ToString();
            entryNode.Attributes.Append(attribute);
        }

        private void WriteVector2(XmlDocument document, XmlNode entryNode, Vector2 vector)
        {
            XmlAttribute attribute = document.CreateAttribute("X");
            attribute.Value = vector.X.ToString();
            entryNode.Attributes.Append(attribute);
            attribute = document.CreateAttribute("Y");
            attribute.Value = vector.Y.ToString();
            entryNode.Attributes.Append(attribute);
        }

        private void WriteVector3(XmlDocument document, XmlNode entryNode, Vector3 vector)
        {
            XmlAttribute attribute = document.CreateAttribute("X");
            attribute.Value = vector.X.ToString();
            entryNode.Attributes.Append(attribute);
            attribute = document.CreateAttribute("Y");
            attribute.Value = vector.Y.ToString();
            entryNode.Attributes.Append(attribute);
            attribute = document.CreateAttribute("Z");
            attribute.Value = vector.Z.ToString();
            entryNode.Attributes.Append(attribute);
        }

        private void WriteVector3(XmlDocument document, XmlNode entryNode, SVector3* vector)
        {
            XmlAttribute attribute = document.CreateAttribute("X");
            attribute.Value = vector->X.ToString();
            entryNode.Attributes.Append(attribute);
            attribute = document.CreateAttribute("Y");
            attribute.Value = vector->Y.ToString();
            entryNode.Attributes.Append(attribute);
            attribute = document.CreateAttribute("Z");
            attribute.Value = vector->Z.ToString();
            entryNode.Attributes.Append(attribute);
        }

        private void WriteBoxMinMax(XmlDocument document, XmlNode entryNode, BoxMinMax* box)
        {
            XmlNode element = document.CreateElement("Min", _xmlNameSpace);
            WriteVector3(document, element, &box->Min);
            entryNode.AppendChild(element);
            element = document.CreateElement("Max", _xmlNameSpace);
            WriteVector3(document, element, &box->Max);
            entryNode.AppendChild(element);
        }

        private void WriteSphere(XmlDocument document, XmlNode entryNode, Sphere* sphere)
        {
            XmlAttribute attribute = document.CreateAttribute("Radius");
            attribute.InnerXml = sphere->Radius.ToString();
            entryNode.Attributes.Append(attribute);
            XmlNode element = document.CreateElement("Center", _xmlNameSpace);
            WriteVector3(document, element, &sphere->Center);
            entryNode.AppendChild(element);
        }

        private void WriteTriangle(XmlDocument document, XmlNode entryNode, byte* fpBin, Triangle* triangle)
        {
            XmlNode element;
            uint* pV = (uint*)(fpBin + triangle->VOffset);
            for (int idx = 0; idx < triangle->VLength; ++idx)
            {
                element = document.CreateElement("V", _xmlNameSpace);
                element.InnerXml = (*pV).ToString();
                ++pV;
                entryNode.AppendChild(element);
            }
            element = document.CreateElement("Nrm", _xmlNameSpace);
            WriteVector3(document, element, &triangle->Nrm);
            entryNode.AppendChild(element);
            element = document.CreateElement("Dist", _xmlNameSpace);
            element.InnerXml = triangle->Dist.ToString();
            entryNode.AppendChild(element);
        }

        private byte* WriteTriangles(XmlDocument document, XmlNode entryNode, byte* fpBin, byte* pBin)
        {
            XmlNode element = document.CreateElement("Triangles", _xmlNameSpace);
            int count = *(int*)pBin;
            pBin += 4;
            Triangle* pT = (Triangle*)(fpBin + *(int*)pBin);
            pBin += 4;
            XmlNode tElement;
            for (int idx = 0; idx < count; ++idx)
            {
                tElement = document.CreateElement("T", _xmlNameSpace);
                WriteTriangle(document, tElement, fpBin, pT++);
                element.AppendChild(tElement);
            }
            entryNode.AppendChild(element);
            return pBin;
        }

        private void WriteFXShaderMaterial(Stream.File stream, List<Stream.File> referencedStreams,
            XmlDocument document, XmlNode entryNode, List<AssetReference> assetReferences, int[] imports, byte* fpBin, FXShaderMaterial* material)
        {
            int length;
            int offset;
            int count;
            XmlAttribute attribute = document.CreateAttribute("ShaderName");
            attribute.Value = FileHelper.GetString(fpBin + material->ShaderNameOffset, material->ShaderNameLength);
            entryNode.Attributes.Append(attribute);
            attribute = document.CreateAttribute("TechniqueName");
            attribute.Value = FileHelper.GetString(fpBin + material->TechniqueNameOffset, material->TechniqueNameLength);
            entryNode.Attributes.Append(attribute);
            XmlNode element = document.CreateElement("Constants", _xmlNameSpace);
            int* pConstantElement = (int*)(fpBin + material->ConstantsOffset);
            for (int idx = 0; idx < material->ConstantsLength; ++idx)
            {
                int* constantElement = (int*)(fpBin + *pConstantElement++);
                ConstantType type = *(ConstantType*)constantElement++;
                attribute = document.CreateAttribute("Name");
                length = *constantElement++;
                offset = *constantElement++;
                attribute.Value = FileHelper.GetString(fpBin + offset, length);
                XmlNode vElement;
                switch (type)
                {
                    case ConstantType.FXShaderConstantTexture:
                        XmlNode tElement = document.CreateElement("Texture", _xmlNameSpace);
                        tElement.Attributes.Append(attribute);
                        vElement = document.CreateElement("Value", _xmlNameSpace);
                        int position = (int)((byte*)constantElement - fpBin);
                        for (int idy = 0; idy < imports.Length; ++idy)
                        {
                            if (imports[idy] == position)
                            {
                                AssetReference assetReference = assetReferences[*constantElement];
                                bool isFound = false;
                                foreach (AssetEntry assetEntry in stream.AssetEntries)
                                {
                                    if (assetEntry.TypeId == assetReference.TypeId && assetEntry.InstanceId == assetReference.InstanceId)
                                    {
                                        vElement.InnerXml = stream.AssetNames[assetEntry.NameOffset].Split(':')[1];
                                        isFound = true;
                                        break;
                                    }
                                }
                                if (!isFound && referencedStreams != null)
                                {
                                    foreach (Stream.File file in referencedStreams)
                                    {
                                        foreach (AssetEntry assetEntry in file.AssetEntries)
                                        {
                                            if (assetEntry.TypeId == assetReference.TypeId && assetEntry.InstanceId == assetReference.InstanceId)
                                            {
                                                vElement.InnerXml = file.AssetNames[assetEntry.NameOffset].Split(':')[1];
                                                isFound = true;
                                                break;
                                            }
                                        }
                                        if (isFound)
                                        {
                                            break;
                                        }
                                    }
                                }
                                if (!isFound)
                                {
                                    vElement.InnerXml = string.Format("Asset not found in stream: [{0:X08}:{1:X08}]", assetReference.TypeId, assetReference.InstanceId);
                                }
                            }
                        }
                        ++constantElement;
                        tElement.AppendChild(vElement);
                        element.AppendChild(tElement);
                        break;
                    case ConstantType.FXShaderConstantFloat:
                        XmlNode fElement = document.CreateElement("Float", _xmlNameSpace);
                        fElement.Attributes.Append(attribute);
                        count = *constantElement++;
                        float* fValue = (float*)(fpBin + *constantElement++);
                        for (int idy = 0; idy < count; ++idy)
                        {
                            vElement = document.CreateElement("Value", _xmlNameSpace);
                            vElement.InnerXml = (*fValue++).ToString();
                            fElement.AppendChild(vElement);
                        }
                        element.AppendChild(fElement);
                        break;
                    case ConstantType.FXShaderConstantInt:
                        XmlNode iElement = document.CreateElement("Int", _xmlNameSpace);
                        iElement.Attributes.Append(attribute);
                        vElement = document.CreateElement("Value", _xmlNameSpace);
                        vElement.InnerXml = (*constantElement++).ToString();
                        iElement.AppendChild(vElement);
                        element.AppendChild(iElement);
                        break;
                    case ConstantType.FXShaderConstantBool:
                        XmlNode bElement = document.CreateElement("Bool", _xmlNameSpace);
                        bElement.Attributes.Append(attribute);
                        vElement = document.CreateElement("Value", _xmlNameSpace);
                        vElement.InnerXml = (*(byte*)constantElement != 0).ToString();
                        ++constantElement;
                        bElement.AppendChild(vElement);
                        element.AppendChild(bElement);
                        break;
                    default:
                        throw new InvalidOperationException(string.Format("Type {0} is unknown.", type));
                }
            }
            entryNode.AppendChild(element);
            attribute = document.CreateAttribute("TechniqueIndex");
            attribute.Value = material->TechniqueIndex.ToString();
            entryNode.Attributes.Append(attribute);
        }

        private void WriteAABTree(XmlDocument document, XmlNode entryNode, int[] relocations, byte* fpBin, AABTree* aabTree)
        {
            XmlAttribute attribute;
            XmlNode element = document.CreateElement("PolyIndices", _xmlNameSpace);
            XmlNode pElement;
            uint* pP = (uint*)(fpBin + aabTree->PolyIndicesOffset);
            for (int idx = 0; idx < aabTree->PolyIndicesLength; ++idx)
            {
                pElement = document.CreateElement("P", _xmlNameSpace);
                pElement.InnerXml = (*pP).ToString();
                element.AppendChild(pElement);
            }
            entryNode.AppendChild(element);
            XmlNode nodeElement;
            byte* pNode = fpBin + aabTree->NodeOffset;
            for (int idx = 0; idx < aabTree->NodeLength; ++idx)
            {
                element = document.CreateElement("Node", _xmlNameSpace);
                nodeElement = document.CreateElement("Min", _xmlNameSpace);
                WriteVector3(document, nodeElement, (SVector3*)pNode);
                pNode += sizeof(SVector3);
                element.AppendChild(nodeElement);
                nodeElement = document.CreateElement("Max", _xmlNameSpace);
                WriteVector3(document, nodeElement, (SVector3*)pNode);
                pNode += sizeof(SVector3);
                element.AppendChild(nodeElement);
                int position = (int)(pNode - fpBin);
                for (int idy = 0; idy < relocations.Length; ++idy)
                {
                    if (relocations[idy] == position)
                    {
                        uint* pChildren = (uint*)(fpBin + *(int*)pNode);
                        XmlNode cElement = document.CreateElement("Children", _xmlNameSpace);
                        attribute = document.CreateAttribute("Front");
                        attribute.Value = (*pChildren).ToString();
                        pChildren += 4;
                        cElement.Attributes.Append(attribute);
                        attribute = document.CreateAttribute("Back");
                        attribute.Value = (*pChildren).ToString();
                        pChildren += 4;
                        cElement.Attributes.Append(attribute);
                        element.AppendChild(cElement);
                    }
                }
                pNode += 4;
                position = (int)(pNode - fpBin);
                for (int idy = 0; idy < relocations.Length; ++idy)
                {
                    if (relocations[idy] == position)
                    {
                        uint* pPolys = (uint*)(fpBin + *(int*)pNode);
                        XmlNode cElement = document.CreateElement("Polys", _xmlNameSpace);
                        attribute = document.CreateAttribute("Begin");
                        attribute.Value = (*pPolys).ToString();
                        pPolys += 4;
                        cElement.Attributes.Append(attribute);
                        attribute = document.CreateAttribute("Count");
                        attribute.Value = (*pPolys).ToString();
                        pPolys += 4;
                        cElement.Attributes.Append(attribute);
                        element.AppendChild(cElement);
                    }
                }
                pNode += 4;
                entryNode.AppendChild(element);
            }
        }

        public override bool HasSpecialDecompileHandling()
        {
            return true;
        }

        public override void Decompile(Stream.File stream, List<Stream.File> referencedStreams,
            XmlDocument document, XmlNode entryNode, List<AssetReference> assetReferences,
            byte[] bin, byte[] imp, byte[] relo)
        {
            int[] imports = new int[imp.Length >> 2];
            fixed (byte* fpImp = &imp[0])
            {
                int* pImp = (int*)fpImp;
                for (int idx = 0; idx < imports.Length; ++idx)
                {
                    imports[idx] = *pImp++;
                }
            }
            int[] relocations = new int[relo.Length >> 2];
            fixed (byte* fpRelo = &relo[0])
            {
                int* pRelo = (int*)fpRelo;
                for (int idx = 0; idx < relocations.Length; ++idx)
                {
                    relocations[idx] = *pRelo++;
                }
            }
            XmlAttribute attribute;
            XmlNode element;
            XmlNode cElement;
            fixed (byte* fpBin = &bin[0])
            {
                byte* pBin = fpBin + 4;
                VertexData vertexData = GetVertexData(fpBin, fpBin + *(int*)pBin);
                pBin += 4;
                for (int idx = 0; idx < vertexData.VerticesCount; ++idx)
                {
                    element = document.CreateElement("Vertices", _xmlNameSpace);
                    List<Vector3> v = vertexData.Vertices[idx];
                    for (int idy = 0; idy < v.Count; ++idy)
                    {
                        cElement = document.CreateElement("V", _xmlNameSpace);
                        WriteVector3(document, cElement, v[idy]);
                        element.AppendChild(cElement);
                    }
                    entryNode.AppendChild(element);
                }
                for (int idx = 0; idx < vertexData.NormalsCount; ++idx)
                {
                    element = document.CreateElement("Normals", _xmlNameSpace);
                    List<Vector3> n = vertexData.Normals[idx];
                    for (int idy = 0; idy < n.Count; ++idy)
                    {
                        cElement = document.CreateElement("N", _xmlNameSpace);
                        WriteVector3(document, cElement, n[idy]);
                        element.AppendChild(cElement);
                    }
                    entryNode.AppendChild(element);
                }
                for (int idx = 0; idx < vertexData.TangentsCount; ++idx)
                {
                    element = document.CreateElement("Tangents", _xmlNameSpace);
                    List<Vector3> t = vertexData.Tangents;
                    for (int idy = 0; idy < t.Count; ++idy)
                    {
                        cElement = document.CreateElement("T", _xmlNameSpace);
                        WriteVector3(document, cElement, t[idy]);
                        element.AppendChild(cElement);
                    }
                    entryNode.AppendChild(element);
                }
                for (int idx = 0; idx < vertexData.BinormalsCount; ++idx)
                {
                    element = document.CreateElement("Binormals", _xmlNameSpace);
                    List<Vector3> b = vertexData.Binormals;
                    for (int idy = 0; idy < b.Count; ++idy)
                    {
                        cElement = document.CreateElement("B", _xmlNameSpace);
                        WriteVector3(document, cElement, b[idy]);
                        element.AppendChild(cElement);
                    }
                    entryNode.AppendChild(element);
                }
                if (vertexData.VertexColors != null)
                {
                    element = document.CreateElement("VertexColors", _xmlNameSpace);
                    List<RGBAColor> c = vertexData.VertexColors;
                    for (int idy = 0; idy < c.Count; ++idy)
                    {
                        cElement = document.CreateElement("C", _xmlNameSpace);
                        WriteRGBAColor(document, cElement, c[idy]);
                        element.AppendChild(cElement);
                    }
                    entryNode.AppendChild(element);
                }
                for (int idx = 0; idx < vertexData.TexCoords.Count; ++idx)
                {
                    element = document.CreateElement("TexCoords", _xmlNameSpace);
                    List<Vector2> tc = vertexData.TexCoords[idx];
                    for (int idy = 0; idy < tc.Count; ++idy)
                    {
                        cElement = document.CreateElement("T", _xmlNameSpace);
                        WriteVector2(document, cElement, tc[idy]);
                        element.AppendChild(cElement);
                    }
                    entryNode.AppendChild(element);
                }
                if (vertexData.BoneInfluencesCount != 0)
                {
                    element = document.CreateElement("BoneInfluences", _xmlNameSpace);
                    bool hasMultipleInfluences = false;
                    XmlNode element2 = document.CreateElement("BoneInfluences", _xmlNameSpace);
                    XmlNode cElement2;
                    for (int idx = 0; idx < vertexData.BoneInfluences.Count; ++idx)
                    {
                        cElement = document.CreateElement("I", _xmlNameSpace);
                        cElement2 = document.CreateElement("I", _xmlNameSpace);

                        element.AppendChild(cElement);
                        element2.AppendChild(cElement2);
                    }
                    entryNode.AppendChild(element);
                    if (hasMultipleInfluences)
                    {
                        entryNode.AppendChild(element2);
                    }
                }
                attribute = document.CreateAttribute("GeometryType");
                attribute.Value = (*(MeshGeometryType*)pBin).ToString();
                pBin += 4;
                entryNode.Attributes.Append(attribute);
                element = document.CreateElement("BoundingBox", _xmlNameSpace);
                WriteBoxMinMax(document, element, (BoxMinMax*)pBin);
                pBin += sizeof(BoxMinMax);
                entryNode.AppendChild(element);
                element = document.CreateElement("BoundingSphere", _xmlNameSpace);
                WriteSphere(document, element, (Sphere*)pBin);
                pBin += sizeof(Sphere);
                entryNode.AppendChild(element);
                pBin = WriteTriangles(document, entryNode, fpBin, pBin);
                element = document.CreateElement("FXShader", _xmlNameSpace);
                WriteFXShaderMaterial(stream, referencedStreams, document, element, assetReferences, imports, fpBin, (FXShaderMaterial*)pBin);
                pBin += sizeof(FXShaderMaterial);
                entryNode.AppendChild(element);
                int position = (int)(pBin - fpBin);
                for (int idx = 0; idx < relocations.Length; ++idx)
                {
                    if (relocations[idx] == position)
                    {
                        element = document.CreateElement("AABTree", _xmlNameSpace);
                        WriteAABTree(document, element, relocations, fpBin, (AABTree*)(fpBin + *(int*)pBin));
                        entryNode.AppendChild(element);
                    }
                }
                pBin += 4;
                attribute = document.CreateAttribute("Hidden");
                attribute.Value = (*pBin != 0).ToString();
                ++pBin;
                entryNode.Attributes.Append(attribute);
                attribute = document.CreateAttribute("CastShadow");
                attribute.Value = (*pBin != 0).ToString();
                ++pBin;
                entryNode.Attributes.Append(attribute);
                attribute = document.CreateAttribute("SortLevel");
                attribute.Value = (*pBin).ToString();
                ++pBin;
                entryNode.Attributes.Append(attribute);
                attribute = document.CreateAttribute("GeometryPickable");
                attribute.Value = (*pBin != 0).ToString();
                ++pBin;
                entryNode.Attributes.Append(attribute);
            }

            // VertexData
            // element Vertices max 2
            // element Normals max 2
            // element Tangents max 1
            // element Binormals max 1
            // element VertexColors max 1
            // element TexCoords unbounded
            // element BoneInfluences max 2
            // element ShadeIndices max 1
        }

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
								color.R = (byte)(float.Parse(colorNode.Attributes.GetNamedItem("R").Value, NumberFormatInfo.InvariantInfo) * 255);
								color.G = (byte)(float.Parse(colorNode.Attributes.GetNamedItem("G").Value, NumberFormatInfo.InvariantInfo) * 255);
								color.B = (byte)(float.Parse(colorNode.Attributes.GetNamedItem("B").Value, NumberFormatInfo.InvariantInfo) * 255);
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
