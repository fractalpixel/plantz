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
  PVector pos = new PVector(0,0,0);
  float flowerRot = 0;
  
  Flower(PlantPart petal,  PlantPart leaf, PVector pos){
    this.petal = petal;
    this.pos = pos;
    this.petalLenght = 1 + random(1);
    this.stalkLength = 2.5 + random(1);
    this.leaf = leaf;
    flowerRot = random(-1, 1);
  }  
  
  void doInit(RandomSequence random) {
  }
  
  void drawPart(PlantContext context, RandomSequence random) {
    if (context.age > 0) {
      pushMatrix();
      translate(pos.x, pos.y, pos.z);
        //stalk
      pushMatrix();
        rotateX(PI);
          drawLayer(0, stalkLength*context.age, 0.1, 0.05, 0, 0, 0,0 );
        popMatrix();
      
      pushMatrix();
        
        translate(0,-stalkLength*context.age, 0);
        
        
        scale(petalLenght*pow(context.age,2));
        
        rotateX((0.5*PI));
        rotateY(0.5+flowerRot);
        
        //float rotateStep = radians(137.508);
        float rotateStep = 2*PI/petalAmount;
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
        popMatrix();
    }
  }
  
  
  
  void drawLayer(float prevY, float y, float prevR, float r, float prevOfsetx, float prevOfsety, float xofset, float yofset){
    if (sideAmount > 0) {
      beginShape(TRIANGLE_STRIP);
      fill(branchColor);
      noStroke();
      for(int i = 0; i < sideAmount+1; i +=1){
        drawVertex(i,y,r,xofset,yofset);
        drawVertex(i,prevY,prevR,prevOfsetx,prevOfsety);
      }  
      
      endShape(TRIANGLE_STRIP);
    }
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
