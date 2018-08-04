class Flower extends PlantPart {
  int petalAmount = 7;
  PlantPart petal;
  PlantPart stalk;
  PlantPart leaf;
  float petalLenght = 1.5;
  float stalkLength = 3;
  color branchColor  =color(50,200,60);
  int sideAmount = 12;
  PVector branchEndPos = new PVector(0,0,0);
  
  Flower(PlantPart petal,  PlantPart leaf){
    this.petal = petal;
    
    
    this.leaf = leaf;
  }  
  
  void doInit(RandomSequence random) {
  }
  
  void drawPart(PlantContext context, RandomSequence random) {
      //stalk
    pushMatrix();
      rotateX(PI);
        drawLayer(0, stalkLength*context.age, 0.1, 0.05, 0, 0, 0,0 );
      popMatrix();
    
    pushMatrix();
      
      translate(0,-stalkLength*context.age, 0);
      
      
      scale(petalLenght*pow(context.age,2));
      
      rotateX((0.5*PI));
      rotateY(0.5);
      
      //float rotateStep = radians(137.508);
      float rotateStep = 2*PI/petalAmount;
      println(rotateStep);
       
      for (int i = 0; i < petalAmount; i++){
         
          rotateZ(rotateStep);
         petal.drawPart(context,random.nextRandom());
         
      }  
      popMatrix();
      pushMatrix();
        translate(0,-stalkLength*context.age*0.5, 0);
        
        scale(petalLenght*pow(context.age,2));
        rotateY(0.5);
        rotateX((0.35*PI));
        
        leaf.drawPart(context,random.nextRandom());
        
      popMatrix();
      pushMatrix();
      translate(0,-stalkLength*context.age*0.5, 0);
        
        scale(petalLenght*pow(context.age,2));
        rotateY(0.5);
        rotateX((0.5*PI));
        rotateZ(PI);
        rotateX((-0.15*PI));
        leaf.drawPart(context,random.nextRandom());
      popMatrix();
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
