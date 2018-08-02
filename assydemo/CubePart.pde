
class CubePart extends PlantPart {
  
  void doInit(RandomSequence random) {
  }
  
  void drawPart(PlantContext context, RandomSequence random) {
    float size = context.age * 10f;
    color(100, 0, 70);
    box(size,size,size);
  }

}
