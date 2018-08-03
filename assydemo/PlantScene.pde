
ArrayList<Plant> flowers = new ArrayList<Plant>();

Plant testPlant;

void setupPlants(){
  RandomSequence random = new RandomSequence(21348);
  
  testPlant = new Plant(new PVector(0,0,0), 42, 
                new Branch(
                   new Apple(), 
                   new Branch(
                     new Apple(), 
                     new Branch(

                       new Apple(), 
                       new Apple()))));
  


  for (int i = 0; i < 200; i++) {
    float areaSize = 20;
    
    float a = random.nextFloat(0, 2*PI);
    float r = random.nextGaussishFloat(0, areaSize);
    float h = r * 0.1 + random.nextGaussishFloat(0, 1);
    
    PVector pos = new PVector(
      sin(a) * r - cos(a) * r,
      h,
      sin(a) * r + cos(a) * r);
      flowers.add(new Plant(pos, random.nextLong(), 
        new Branch(null, new Leaf())        
      ));
  }

  for (Plant plant : flowers) {
    plant.init(random);
  }
} 


void drawPlants(float time){
  testPlant.context.age = (sin(TURN * time * 0.02) + 1.0) * 0.5;
  println(testPlant.context.age);
  pushMatrix();
  testPlant.drawPlant(); 
  popMatrix();
  
  for (Plant plant : flowers) {
    plant.drawPlant();
  }
  
}
  
  
