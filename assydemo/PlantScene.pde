

Plant testPlant;

void setupPlants(){
  testPlant = new Plant(new PVector(0,0,0), 42, 
                new Branch(
                   new Apple(), 
                   new Branch(
                     new Apple(), 
                     new Branch(
                       new Apple(), 
                       new Apple()))));
  
} 


void drawPlants(float time){
  testPlant.context.age = (sin(TURN * time * 0.1) + 1.0) * 0.5; 
  pushMatrix();
  translate(0, 15, 0);
  testPlant.drawPlant(); 
  popMatrix();
  
}
  
  
