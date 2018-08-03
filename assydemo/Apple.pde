class Apple extends PlantPart {
  
  float size = 10f;
  color youngColor = #40A020;
  color oldColor = #A03060;
  
  void doInit(RandomSequence random) {
  }
  
  void drawPart(PlantContext context, RandomSequence random) {
    if (context.age <= 0.3){
        drawFlower();  
        
    
    
    }  
    else{
        drawFuit(context);
    }  
    
  }
  
  
  void drawFlower(){
    //fill(oldColor);
    //translate(5, -5,5);
    //sphere(0.5);
  }  
  
  void drawFuit(PlantContext context){
    float s = size * context.age;
    translate(0, -s/2,0);
    fill(lerpColor(youngColor, oldColor, context.age));
    sphereDetail(16);
    sphere(s);
  }  
  

  
  
}
