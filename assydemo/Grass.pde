class Grass extends PlantPart {
  float stalkLength = 2.5;
  color branchColor  =color(50,200,60);
  int sideAmount = 12;
  PVector branchEndPos = new PVector(0,0,0);
  int grassAmount = 20;
   float patchWidth = 10;
 
 Grass(){
   
 }
 Grass(int grassAmount, int patchWidth){
   this.grassAmount = grassAmount;
   this.patchWidth = patchWidth;
 }

  void doInit(RandomSequence random) {
  }
  
  void drawPart(PlantContext context, RandomSequence random) {
      //stalk
      for (int i = 0; i < grassAmount; i  ++ ){
          
          pushMatrix();
          translate((random.nextFloat()*patchWidth)- (0.5*patchWidth),0,(random.nextFloat()*patchWidth)- (0.5*patchWidth));
          rotateX(PI-random.nextFloat(0.25));
          float stalkL = stalkLength*context.age*(random.nextFloat(0.5)+0.5);
        
          drawLayer(0, stalkL*0.5, 0.08, 0.05, 0, 0, 0,0 );
          
     
          drawLayer(stalkL*0.5, stalkL, 0.05, 0.01, 0, 0, random.nextFloat(0.5)-0.25,0 );
         
          popMatrix();
      
      }
    
    
  }
  
  
  
  
  void drawLayer(float prevY, float y, float prevR, float r, float prevOfsetx, float prevOfsety, float xofset, float yofset){
    beginShape(TRIANGLE_STRIP);
    fill(branchColor);
    noStroke();
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
      
