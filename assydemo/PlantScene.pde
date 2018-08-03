

Plant testPlant;

void setupPlants(){
 /* testPlant = new Plant(new PVector(0,0,0), 42, 
                new Branch(
                   new Apple(), 
                   new Branch(
                     new Apple(), 
                     new Branch(

                       new Apple(), 
                       new Apple()))));
 */                        
  testPlant = new Plant(new PVector(0,-10,0), 42, 
                new Flower(new Leaf(color(50,50,200))));


} 


void drawPlants(float time){
  testPlant.context.age = (sin(TURN * time * 0.02) + 1.0) * 0.5;
  //println(testPlant.context.age);
  pushMatrix();
  translate(0, 15, 0);
  testPlant.drawPlant(); 
  popMatrix();
  
}
  
  
