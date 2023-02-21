attribute vec3 aRandom;

varying vec3 vPosition;

uniform float uTime;
uniform float uScale;

void main() {
  vec3 pos = position;

  float time = uTime * 4.0;

  pos.x += sin(time * aRandom.x) * 0.01;
  pos.y += cos(time * aRandom.y) * 0.01;
  pos.z += cos(time * aRandom.z) * 0.01;

  pos.x *= uScale + (sin(pos.y * 4.0 + time)) * (1. - uScale);
  pos.y *= uScale + (sin(pos.z * 4.0 + time)) * (1. - uScale);
  pos.z *= uScale + (sin(pos.x * 4.0 + time)) * (1. - uScale);

  pos *= uScale;

  vec4 modelPosition = modelMatrix * vec4(pos, 1.0);
  vec4 viewPosition = viewMatrix * modelPosition;
  vec4 projectedPosition = projectionMatrix * viewPosition;

  gl_Position = projectedPosition;
  gl_PointSize = 8.0 / -viewPosition.z;

  vPosition = position;
}