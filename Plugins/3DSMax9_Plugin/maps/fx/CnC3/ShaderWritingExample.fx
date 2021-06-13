//////////////////////////////////////////////////////////////////////////////
// ©2007 Electronic Arts Inc
//
// FX Shader for simple unlit rendering
//////////////////////////////////////////////////////////////////////////////

// This is used by 3dsmax to load the correct parser
#if !defined(_WW3D_)
string ParamID = "0x1";
#endif



// ----------------------------------------------------------------------------
// Material parameters
// ----------------------------------------------------------------------------
float3 ColorEmissive
<
	string UIName = "Emissive Material Color";
    string UIWidget = "Color";
> = float3(1.0, 1.0, 1.0);


texture Texture_0
<
	string UIName = "Base Texture";
>;
sampler2D Texture_0Sampler = sampler_state
{
	Texture = < Texture_0 >;
	MinFilter = Linear;
	MagFilter = Linear;
	MipFilter = Linear;
	AddressU = Wrap;
	AddressV = Wrap;
};

float4 TexCoordTransform_0
<
	string UIName = "UV0 Scl/Move";
    string UIWidget = "Spinner";
	float UIMin = -100;
	float UIMax = 100;
> = float4(1.0, 1.0, 0.0, 0.0);

bool DepthWriteEnable
<
	string UIName = "Depth Write Enable";
> = true;

bool AlphaBlendingEnable
<
	string UIName = "Alpha Blend Enable";
> = false;

bool FogEnable
<
	string UIName = "Fog Enable";
> = true;


// ----------------------------------------------------------------------------
// Engine data
// ----------------------------------------------------------------------------

struct WW3DFog
{
	float IsEnabled;
	float4 Color;
	float RangeStart;
	float OneOverRangeDelta; // = 1.0 / (RangeEnd - RangeStart)
};

// Calculate the "distance fog value", appropriate for use with the FOG output semantic of a vertex shader.
// Returns 1.0 for completely un-fogged areas, and 0.0 for completely fogged, between that if partially fogged.
float CalculateFog(WW3DFog Fog, float3 WorldPosition, float3 CameraPosition)
{
	return 1.0 - Fog.IsEnabled * saturate((length(WorldPosition - CameraPosition) - Fog.RangeStart) * Fog.OneOverRangeDelta);
}

WW3DFog Fog
<
	string UIWidget = "None";
	string SasBindAddress = "WW3D.Fog";
> =  { false, float4(1, 1, 1, 1), 0, 0.001 };

// ----------------------------------------------------------------------------
// Transformations
// ----------------------------------------------------------------------------
float4x4 WorldViewProjection : WorldViewProjection;
float4x3 World : World;
float4x3 ViewI : ViewInverse;
float Time : Time;


// ----------------------------------------------------------------------------
// SHADER: Default technique
// ----------------------------------------------------------------------------
struct VSOutput
{
	float4 Position : POSITION;
	float3 DiffuseColor : COLOR0;
	float Fog : COLOR1;
	float2 BaseTexCoord : TEXCOORD0;
};

// ----------------------------------------------------------------------------
VSOutput VS(float3 Position : POSITION, float2 TexCoord0 : TEXCOORD0)
{
	VSOutput Out;
	
	Out.Position = mul(float4(Position, 1), WorldViewProjection);
	float3 worldPosition = mul(float4(Position, 1), World);
	
	Out.DiffuseColor = ColorEmissive;
	
	Out.BaseTexCoord = TexCoord0 * TexCoordTransform_0.xy + Time * TexCoordTransform_0.zw;
	
	Fog.IsEnabled = Fog.IsEnabled && FogEnable;
	Out.Fog = CalculateFog(Fog, worldPosition, ViewI[3]);
	
	return Out;
}

// ----------------------------------------------------------------------------
float4 PS(VSOutput In) : COLOR
{
	float4 color = float4(In.DiffuseColor, 1.0);
	color *= tex2D(Texture_0Sampler, In.BaseTexCoord);
	color.xyz = lerp(Fog.Color, color.xyz, In.Fog);
	return color;
}

technique Default
{
	pass P0
	{
		VertexShader = compile vs_1_1 VS();
		PixelShader = compile ps_1_1 PS();

		ZEnable = true;
		ZFunc = LessEqual;
		ZWriteEnable = ( DepthWriteEnable );
		CullMode = CW;
		AlphaTestEnable = false;
		AlphaBlendEnable = ( AlphaBlendingEnable );
		SrcBlend = SrcAlpha;
		DestBlend = InvSrcAlpha;
	}  
}
