class Branch extends PlantPart {
  PlantPart tip = null;
  PlantPart branch = null;
  PVector endPos;
  int sideAmount = 12;
  float brancHeight = 12;
  float branchMaxWidth = 1;
  float minWidth = 0.1;
  float branchChange = branchMaxWidth-minWidth;
  float maxOfset = 0.8;
  color branchColor = color(222,184,135);
  
  void doInit(RandomSequence random) {
  }
  
  void drawPart(PlantContext context, RandomSequence random) {
    noStroke();
    drawBranch(context,random);
    
  }  
  
  void drawBranch(PlantContext context, RandomSequence random) {
    float xofset = 0;
    float yofset = 0;
    float prevR = (pow(1, 1.2)*(branchChange))+ minWidth;
    float prevOfsetx = 0;
    float prevOfsety = 0;
    for (int i = 1; i <= brancHeight; i += 1){
      float r =  (pow((((float)brancHeight-i)/brancHeight), 1.2)*(branchChange))+ minWidth;
      xofset += (random.nextFloat(2*maxOfset)-maxOfset)*pow(context.age, 2);
      yofset += (random.nextFloat(2*maxOfset)-maxOfset)*pow(context.age, 2);
      drawLayer(-(-1+i)*context.age, -i*context.age,prevR*context.age,r*context.age, prevOfsetx, prevOfsety,xofset, yofset );
      prevR = r;
      prevOfsetx = xofset;
      prevOfsety = yofset;
      
    }  
    
  }
  
  
  
  
  void drawLayer(float prevY, float y, float prevR, float r, float prevOfsetx, float prevOfsety, float xofset, float yofset){
    beginShape(TRIANGLE_STRIP);
    fill(branchColor);
    for(int i = 0; i < sideAmount+1; i +=1){
      drawVertex(i,y,r,xofset,yofset);
      drawVertex(i,prevY,prevR,prevOfsetx,prevOfsety);
    }  
    
    endShape(TRIANGLE_STRIP);
  }  
  
  void drawVertex(float i, float y,  float r, float xofset, float yofset){
      float a = i*1/(sideAmount+0.001);
      float x = cos(2*PI*a)*r+ xofset;
      float z = sin(2*PI*a)*r + yofset;
      
      vertex(x, y, z);     
  }
  
  
}




  
