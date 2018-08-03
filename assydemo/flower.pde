class Flower extends PlantPart {
  int petalAmount = 13;
  PlantPart petal;
  float petalLenght = 3;
  
  
  Flower(PlantPart petal){
    this.petal = petal;
  }  
  
  void doInit(RandomSequence random) {
  }
  
  void drawPart(PlantContext context, RandomSequence random) {
      pushMatrix();
      
      rotateX((0.5*PI));
      rotateY(1);
      float rotateStep = radians(137.508);
      println(rotateStep);
       scale(petalLenght);
      for (int i = 0; i < petalAmount; i++){
         
          rotateZ(rotateStep);
         petal.drawPart(context,random.nextRandom());
         
      }  
      popMatrix();
  
  }
  
}  
