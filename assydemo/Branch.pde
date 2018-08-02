class Branch extends PlantPart {
  
  void doInit(RandomSequence random) {
  }
  
  void drawPart(PlantContext context, RandomSequence random) {
    float size = 1f + context.age * 10f;
    fill(200, 0, 70);
    translate(0, -size/2,0);
    box(size,size,size);
  }

}
