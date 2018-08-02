float mix(float t, float a, float b) {
  return (b - a) * t + a;
}

double mix(double t, double a, double b) {
  return (b - a) * t + a;
}

float mapClamp(float value, float sourceStart, float sourceEnd, float destStart, float destEnd) {
  return map(constrain(value, sourceStart, sourceEnd), sourceStart, sourceEnd, destStart, destEnd);
  
}
