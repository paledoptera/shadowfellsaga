//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float Time;
uniform vec2 Texel;

const float Xspeed = 0.002;
const float Xfreq = 20.0;
const float Xsize = 5.0;

const float Yfreq = 100.0;
const float Ysize = 20.0;

void main()
{
	//X wave
	float Xwave = sin(Time*Xspeed + v_vTexcoord.y*Xfreq) * (Xsize*Texel.x) * v_vTexcoord.y;
	float Ywave = sin(Time*Xspeed + v_vTexcoord.y*Yfreq) * (Ysize*Texel.y) * v_vTexcoord.y;
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord + vec2(Xwave, Ywave));
}
