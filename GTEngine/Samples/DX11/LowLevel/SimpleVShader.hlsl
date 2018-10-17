// David Eberly, Geometric Tools, Redmond WA 98052
// Copyright (c) 1998-2018
// Distributed under the Boost Software License, Version 1.0.
// http://www.boost.org/LICENSE_1_0.txt
// http://www.geometrictools.com/License/Boost/LICENSE_1_0.txt
// File Version: 3.0.0 (2016/06/19)

cbuffer PVWMatrix
{
    float4x4 pvwMatrix;
};

struct VS_INPUT
{
    float3 modelPosition : POSITION;
    float4 modelColor : COLOR0;
    float2 modelTCoord : TEXCOORD0;
};

struct VS_OUTPUT
{
    float4 vertexColor : COLOR0;
    float2 vertexTCoord : TEXCOORD0;
    float4 clipPosition : SV_POSITION;
};

VS_OUTPUT VSMain(VS_INPUT input)
{
    VS_OUTPUT output;
    output.clipPosition = mul(pvwMatrix, float4(input.modelPosition, 1.0f));
    output.vertexColor = input.modelColor;
    output.vertexTCoord = input.modelTCoord;
    return output;
}
