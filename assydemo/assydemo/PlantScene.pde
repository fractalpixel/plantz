

Plant testPlant;

void setupPlants(){
  testPlant = new Plant(new PVector(0,0,0), 42, new Branch(new CubePart(), null));
  
} 


void drawPlants(float time){
  testPlant.context.age = (sin(TURN * time * 0.1) + 1.0) * 0.5; 
  testPlant.drawPlant();  
  
}
  
  
