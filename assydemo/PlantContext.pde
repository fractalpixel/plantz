
// Info about a plant that affects parts.
class PlantContext {
  
  
  float age = 0.5;
  
  PlantContext(float age){
     this.age = age; 
  }
  
  PlantContext(){
  }
  
  PlantContext copy() {
    return new PlantContext(age);
  }
}
