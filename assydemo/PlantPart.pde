
/**
* Something that a plant is built from.
*/
class PlantPart {
  
  private ArrayList<PlantPart> childParts = new ArrayList<PlantPart>();
  
  ArrayList<PlantPart> getChildParts() {
    return childParts;
  }
  
  void addChildPart(PlantPart part) {
    childParts.add(part);
  }
  
  final void init(RandomSequence random) {    
    doInit(random.nextRandom());

    for (PlantPart part : getChildParts()) {
      part.init(random.nextRandom());
    }
  }  
  
  void doInit(RandomSequence random) {
  }
  
  void drawPart(PlantContext context, RandomSequence random) {
  }
  

}
