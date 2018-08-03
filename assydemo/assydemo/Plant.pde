
class Plant {
  PVector groundPos;
  PVector growDirection;

  long seed;

  PlantPart part;
  
  PlantContext context = new PlantContext();
  
  private RandomSequence random = new RandomSequence();
  
  Plant(PVector pos, long seed, PlantPart part){
     this.seed = seed;
     this.part = part;
     groundPos = pos.copy();
     growDirection = new PVector(0, 0, 1);
  }  
  
  void drawPlant(){
    pushMatrix();
    translate(groundPos.x, groundPos.y, groundPos.z);
    noFill();
    stroke(255);

    random.setSeed(seed);
    part.drawPart(context, random);
    
    popMatrix();
  }  
   
}
