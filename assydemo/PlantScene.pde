
ArrayList<Plant> flowers = new ArrayList<Plant>();
float treeAge = 1;
float singleGrassAge = 1;
float singleFlowerAge = 1;
float grassPatchAge = 1;
float flowerPatchAge = 1;
Plant tree;
Plant singleGrass;
Plant singleFlower;
Plant grassPatch;

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
           
                  new Leaf(), new PVector(0,0,0)
                )
              );
              
   grassPatch = new Plant(new PVector(0,0,0), 42, new Grass(100, 30));    
    singleGrass = new Plant(new PVector(0,0,0), 42, new Grass(1, 0));          


  for (int i = 0; i < 75; i++) {
    flowers.add(new Plant(new PVector(0,0,0), 42, 
                new Flower(
                  new Leaf(color(random(50, 255),random(50, 255),random(50, 255))),
           
                  new Leaf(), new PVector(((random(1)*25)- (0.5*25)),0,(random(1)*25)- (0.5*25))
                )
              ));
              
     
  }


} 


void drawPlants(float time){
  tree.context.age = treeAge;
  singleGrass.context.age = singleGrassAge;
  singleFlower.context.age = singleFlowerAge;
  grassPatch.context.age = grassPatchAge;
  //println(testPlant.context.age);
  
  tree.drawPlant(); 
  
  grassPatch.drawPlant();
  
  singleGrass.drawPlant(); 
  pushMatrix();
  translate(3, 0,0);
  singleFlower.drawPlant();
  popMatrix();
  
  
  for (Plant plant : flowers) {
    plant.context.age = flowerPatchAge;
    pushMatrix();
    plant.drawPlant();
    popMatrix();
  }
  
}
  
  
