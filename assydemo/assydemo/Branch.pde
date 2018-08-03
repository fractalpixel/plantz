class Branch extends PlantPart {
  PlantPart tip = null;
  PlantPart branch = null;
  PVector endPos;
  int sideAmount = 12;
  float maxBrancHeight = 50;
  float branchMaxWidth = 0.8;
  float minWidth = 0.05;
  float branchChange = branchMaxWidth-minWidth;
  float maxOfset = 0.4;
  color branchColor = color(222,184,135);
  int brancHeight = 0;
  float branchStep = 1;
  PVector branchEnd = new PVector(0,0,0);
  
  Branch(PlantPart tip, PlantPart branch){
    this.tip = tip;
    this.branch = branch;
    
  }   

  
  void doInit(RandomSequence random) {
  }
  
  void drawPart(PlantContext context, RandomSequence random) {
    noStroke();
    drawBranch(context,random);
    if (tip != null){
      pushMatrix();
      translate(branchEnd.x, branchEnd.y, branchEnd.z);
      tip.drawPart(context,random.nextRandom());
      popMatrix();
    }  
    
  }  
  
  void drawBranch(PlantContext context, RandomSequence random) {
    float xofset = 0;
    float yofset = 0;
    brancHeight = (int)(context.age*maxBrancHeight);
    float prevR = context.age*(pow(1, 1.2)*(branchChange))*(brancHeight/maxBrancHeight)+ minWidth;
    float prevOfsetx = 0;
    float prevOfsety = 0;
    float prevY  = 0;
  
    
    for (int i = 1; i <= brancHeight; i += 1){
      float branchToTop = ((float)(brancHeight-i)/brancHeight);
      float r =  context.age*(pow((((float)brancHeight-i)/brancHeight), 1.2)*(branchChange))*pow(branchToTop, 1.5)+ minWidth;
      xofset += (random.nextFloat(2*maxOfset)-maxOfset)*pow(context.age, 1)*branchToTop*branchToTop;
      yofset += (random.nextFloat(2*maxOfset)-maxOfset)*pow(context.age, 1)*branchToTop*branchToTop;
      float ystep = branchStep*context.age*pow(branchToTop,2);
      float y = prevY-ystep;
      drawLayer(prevY, y,prevR*context.age,r*context.age, prevOfsetx, prevOfsety,xofset, yofset );
      prevR = r;
      prevOfsetx = xofset;
      prevOfsety = yofset;
      prevY = y;
      
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
      branchEnd.x = x;
      branchEnd.y = y;
      branchEnd.z = z;
  }
  
  
}




  
