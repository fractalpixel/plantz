class Ball extends PlantPart {
  
  float size = 10f;
  color youngColor = #40A020;
  color oldColor = #A03060;
  
  void doInit(RandomSequence random) {
  }
  
  void drawPart(PlantContext context, RandomSequence random) {
    float s = size * context.age;
    
    translate(0, -s/2,0);
    fill(lerpColor(youngColor, oldColor, context.age));
    sphereDetail(16);
    sphere(s);
  }
  
  
}
