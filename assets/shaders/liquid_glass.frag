#version 460 core
#include <flutter/runtime_effect.glsl>

#define WIDTH  (80.0)
#define HEIGHT (40.0)

out vec4 fragColor;

uniform vec2  resolution;
uniform float touchX;
uniform float touchY;
uniform sampler2D image;

// Signed distance function for a rounded rectangle
float sdRoundedRect(vec2 pos, vec2 halfSize, vec4 cornerRadius) {
    vec2 r = cornerRadius.xy;
    if (pos.x < 0.0) r = cornerRadius.zw;
    if (pos.y < 0.0) r.y = r.x;

    vec2 q = abs(pos) - halfSize + r.x;
    return min(max(q.x, q.y), 0.0) + length(max(q, vec2(0.0))) - r.x;
}

float boxSDF(vec2 uv) {
    return sdRoundedRect(uv, vec2(WIDTH, HEIGHT), vec4(HEIGHT));
}

// Simple 2D hash / pseudo-random
vec2 randomVec2(vec2 co) {
    return fract(sin(vec2(
        dot(co, vec2(127.1, 311.7)),
        dot(co, vec2(269.5, 183.3))
    )) * 43758.5453);
}

// Sample with tiny noise offset
vec3 sampleWithNoise(vec2 uv, float timeOffset, float mipLevel) {
    vec2 seed = uv + vec2(touchX + touchY + timeOffset);
    vec2 offset = randomVec2(seed) / resolution.x;
    return texture(image, uv + offset * pow(2.0, mipLevel)).rgb;
}

// Cheap blur using multiple noisy samples
vec3 getBlurredColor(vec2 uv, float mipLevel) {
    vec3 sum =
        sampleWithNoise(uv, 0.00, mipLevel) +
        sampleWithNoise(uv, 0.25, mipLevel) +
        sampleWithNoise(uv, 0.50, mipLevel) +
        sampleWithNoise(uv, 0.75, mipLevel) +
        sampleWithNoise(uv, 1.00, mipLevel) +
        sampleWithNoise(uv, 1.25, mipLevel) +
        sampleWithNoise(uv, 1.50, mipLevel) +
        sampleWithNoise(uv, 1.75, mipLevel) +
        sampleWithNoise(uv, 2.00, mipLevel);
    return sum * 0.11111111;  // ? 1/9
}

vec3 saturate(vec3 color, float factor) {
    float gray = dot(color, vec3(0.299, 0.587, 0.114));
    return mix(vec3(gray), color, factor);
}

// Fake refraction offset ? no derivatives
vec2 computeRefractOffset(float sdf, vec2 centeredUV) {
    if (sdf >= 0.1) {
        // Use direction from center of the glass blob toward current point
        vec2 dir = normalize(centeredUV);
        float strength = pow(abs(sdf), 12.0) * -0.12;
        return dir * strength;
    }
    return vec2(0.0);
}

// Fake highlight ? no derivatives (simple inner glow)
float highlight(float sdf) {
    if (sdf >= 0.1) {
        float t = smoothstep(0.1, 0.0, sdf);
        return t * 0.6;
    }
    return 0.0;
}

void main() {
    vec2 fragCoord = FlutterFragCoord().xy;
    fragCoord.y = resolution.y - fragCoord.y;           // Flip Y for Flutter

    // Center coordinates relative to touch position
    vec2 centeredUV = fragCoord - vec2(touchX * resolution.x, (1.0 - touchY) * resolution.y);

    float sdf = boxSDF(centeredUV);
    float normalizedInside = (sdf / HEIGHT) + 1.0;
    float edgeBlendFactor = pow(normalizedInside, 12.0);

    // Base background texture
    vec3 baseTex = texture(image, fragCoord / resolution).rgb;

    // Sample position with fake refraction
    vec2 sampleUV = (fragCoord / resolution) + computeRefractOffset(normalizedInside, centeredUV);

    float mipLevel = mix(2.5, 1.0, edgeBlendFactor);
    vec3 blurredTex = getBlurredColor(sampleUV, mipLevel) * 0.8 + 0.2;

    // Extra saturation near edges
    blurredTex = mix(blurredTex, pow(saturate(blurredTex, 2.0), vec3(0.5)), edgeBlendFactor);

    // Add fake highlight/glow
    blurredTex += vec3(highlight(normalizedInside) * pow(edgeBlendFactor, 5.0));

    // Mask: inside the blob = 1, outside = 0
    float boxMask = 1.0 - clamp(sdf, 0.0, 1.0);

    fragColor = vec4(mix(baseTex, blurredTex, boxMask), 1.0);
}