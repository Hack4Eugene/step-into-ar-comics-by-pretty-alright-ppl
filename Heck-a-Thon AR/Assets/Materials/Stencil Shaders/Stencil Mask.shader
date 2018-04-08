Shader "FX/StencilMask" 
{
	Properties
	{
		_ID("Mask Value ID", int) = 1
	}
		SubShader
	{
		Tags { "RenderType" = "Opaque" "Queue" = "Geometry+1"}
		Colormask 0
		ZWrite off

		Stencil
		{
			Ref[_ID]
			Comp always
			Pass Replace
		}

		Pass
		{
			CGINCLUDE
			struct appdata
			{
				float4 vertex : POSITION;
			};
			struct v2f
			{
				float4 pos : SV_POSITION;
			};

			v2f vert(appdata v)
			{
				v2f o;
				o.pos = UnityObjectToClipPos(v.vertex);
				return o;
			}

			half4 frag(v2f i) : SV_Target
			{
				return half4(1,1,1,1);
			}
		}
		ENDCG
	}
}
}
	

