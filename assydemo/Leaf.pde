
class Leaf extends PlantPart {
  
  
  
  void doInit(RandomSequence random) {
  }
  
  void drawPart(PlantContext context, RandomSequence random) {
    
    
    //draw leaf
    float leafstep = -10;
    beginShape(POINTS);
    fill(0,255,0);
    for (int i = -100; i <=100; i = i+1){
      leafstep = 0.01*i;
      vertex(leafEquationX(leafstep)*10,leafEquationY(leafstep)*10,0);
    } 
    endShape(POINTS);
  }
  
  
  float leafEquationX(float t){
    return sin(t)*cos(t)*(log(abs(t)+0.00001));
   //x  =  sintcostln|t|  (3)
     
  }  
  
  float leafEquationY(float t){
    //y  =  |t|^(0.3)(cost)^(1/2), 
    //http://mathworld.wolfram.com/HeartCurve.html
    return pow(abs(t), 0.3)*pow(cos(t),0.5);
  }
}
