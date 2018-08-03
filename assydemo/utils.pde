float mix(float t, float a, float b) {
  return (b - a) * t + a;
}

double mix(double t, double a, double b) {
  return (b - a) * t + a;
}

float mapClamp(float value, float sourceStart, float sourceEnd, float destStart, float destEnd) {
  return map(constrain(value, sourceStart, sourceEnd), sourceStart, sourceEnd, destStart, destEnd);
  
}

void normal(PVector n) {
  normal(n.x, n.y, n.z);
}

void vertex(PVector v) {
  vertex(v.x, v.y, v.z);
}

void translate(PVector v) {
  translate(v.x, v.y, v.z);
}


private PVector t1 = new PVector();
private PVector t2 = new PVector();
PVector faceNormal(PVector p1, PVector p2, PVector p3, PVector normal) {
  t1.set(p1);
  t1.sub(p2);
  
  t2.set(p1);
  t2.sub(p3);

  t1.cross(t2, normal);
  return normal;
}

private PVector tNormal = new PVector();

void addTriangle(PVector p1, PVector p2, PVector p3) {
  faceNormal(p1, p2, p3, tNormal);
  normal(tNormal);
  vertex(p1);
  vertex(p2);
  vertex(p3);
}

void addTriangle(PVector p1, PVector p2, PVector p3, color c) {
  addTriangle(p1, p2, p3, c, c, c);
}

void addTriangle(PVector p1, PVector p2, PVector p3, color c1, color c2, color c3) {
  faceNormal(p1, p2, p3, tNormal);
  normal(tNormal);

  fill(c1);
  vertex(p1);

  fill(c2);
  vertex(p2);

  fill(c3);
  vertex(p3);
}
