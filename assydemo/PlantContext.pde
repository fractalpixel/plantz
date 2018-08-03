
// Info about a plant that affects parts.
class PlantContext {
  
  
  float age = 0.5;
  float plantAge = 0.5;
  
  PlantContext(float age){
     this.age = age; 
     plantAge = age;
  }
  
  PlantContext(){
  }
  
  PlantContext copy() {
    PlantContext copy = new PlantContext(age);
    copy.plantAge = plantAge;
    copy.age = age;
    return copy;
  }
}
