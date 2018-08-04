
ArrayList<Plant> flowers = new ArrayList<Plant>();
float treeAge = 1;
float singleGrassAge = 1;
float singleFlowerAge = 1;

Plant tree;
Plant singleGrass;
Plant singleFlower;

void setupPlants(){
  RandomSequence random = new RandomSequence(21348);
  
 tree = new Plant(new PVector(0,0,0), 42, 
                new Branch(
                   new Leaf(), 
                   new Branch(
                     new Leaf(), 
                     new Branch(

                       new Leaf(), 
                       new Leaf()))));
                        
  singleFlower = new Plant(new PVector(0,0,0), 42, 
                new Flower(
                  new Leaf(color(100,100,200)),
           
                  new Leaf()
                )
              );
              
   // testPlant2 = new Plant(new PVector(0,0,0), 42, new Grass());    
    singleGrass = new Plant(new PVector(0,0,0), 42, new Grass(1, 0));          


  for (int i = 0; i < 200; i++) {
    float areaSize = 20;
    
    float a = random.nextFloat(0, 2*PI);
    float r = random.nextGaussishFloat(0, areaSize);
    float h = r * 0.1 + random.nextGaussishFloat(0, 1);
    
    PVector pos = new PVector(
      sin(a) * r - cos(a) * r,
      h,
      sin(a) * r + cos(a) * r);
  }

  for (Plant plant : flowers) {
    plant.init(random);
  }
} 


void drawPlants(float time){
  tree.context.age = treeAge;
  singleGrass.context.age = singleGrassAge;
  singleFlower.context.age = singleFlowerAge;
  //println(testPlant.context.age);
  
  tree.drawPlant(); 
  
  
  
  singleGrass.drawPlant(); 
  pushMatrix();
  translate(3, 0,0);
  singleFlower.drawPlant();
  popMatrix();
  
  
  /*or (Plant plant : flowers) {
    plant.context.age = (sin(TURN * time * 0.03) + 1.0) * 0.5;
    plant.drawPlant();
  }*/
  
}
  
  
