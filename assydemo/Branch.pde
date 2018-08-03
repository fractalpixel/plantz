class Branch extends PlantPart {
  PlantPart tip = null;
  PlantPart branch = null;
  PVector endPos;
  int sideAmount = 12;
  float maxBrancHeight = 70;
  float branchMaxWidth = 0.8;
  float minWidth = 0.05;
  float branchChange = branchMaxWidth-minWidth;
  float maxOfset = 0.4;
  color branchColor = color(222,184,135);
  int brancHeight = 0;
  float branchStep = 1;
  PVector branchEndPos = new PVector(0,0,0);
 
  
  
  Branch(PlantPart tip, PlantPart branch){
    this.tip = tip;
    this.branch = branch;
    
  }  
  
  void doInit(RandomSequence random) {
  }
  
  void drawPart(PlantContext context, RandomSequence random) {
    noStroke();
    drawBranch(context,random);
    pushMatrix();
    translate(branchEndPos.x, branchEndPos.y, branchEndPos.z);
    scale(-0.1*context.age);
    
    tip.drawPart(context,random.nextRandom());
    popMatrix();
    
    
  }  
  
  void drawBranch(PlantContext context, RandomSequence random) {
    float xofset = 0;
    float yofset = 0;
    brancHeight = (int)(context.age*maxBrancHeight);
    float prevR = context.age*(pow(1, 1.2)*(branchChange))*(brancHeight/maxBrancHeight)+ minWidth;
    float prevOfsetx = 0;
    float prevOfsety = 0;
    float prevY  = 0;
    int numberOfBranches = 20;
    int stepsBetweenBranch = (int)maxBrancHeight/numberOfBranches;
    int stepsUntilNext = stepsBetweenBranch+((int)random.nextFloat(4));
    for (int i = 1; i <= brancHeight; i += 1){     
      float branchToTop = ((float)(brancHeight-i)/brancHeight);
      float r =  context.age*(pow((((float)brancHeight-i)/brancHeight), 1.2)*(branchChange))*pow(branchToTop, 1.5)+ minWidth;
      xofset += (random.nextFloat(2*maxOfset)-maxOfset)*pow(context.age, 2)*branchToTop*branchToTop;
      yofset += (random.nextFloat(2*maxOfset)-maxOfset)*pow(context.age, 2)*branchToTop*branchToTop;
      float ystep = branchStep*context.age*pow(branchToTop,2);
      float y = prevY-ystep;
      drawLayer(prevY, y,prevR*context.age,r*context.age, prevOfsetx, prevOfsety,xofset, yofset );
      prevR = r;
      prevOfsetx = xofset;
      prevOfsety = yofset;
      if (stepsUntilNext ==0){
          if (branch != null){
            pushMatrix();
            translate(branchEndPos.x, branchEndPos.y, branchEndPos.z);
            scale(0.9);
            rotateY(random.nextFloat(2*PI));
            rotateX(0.5*PI+(random.nextFloat(1)-0.8));
            
            println(random.nextFloat(2*PI));
            
            branch.drawPart(new PlantContext(branchToTop),random.nextRandom());
            stepsUntilNext = stepsBetweenBranch+((int)random.nextFloat(4))-2;
            popMatrix();
          }
      }
      
      stepsUntilNext --;
      
      
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
      branchEndPos.x = x;
      branchEndPos.y = y;
      branchEndPos.z = z;
      
  }
  
  
}
