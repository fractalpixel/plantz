
class Leaf extends PlantPart {
  
  private PVector p1 = new PVector();
  private PVector p2 = new PVector();
  private PVector p3 = new PVector();
  
  
  void doInit(RandomSequence random) {
  }
  
  void drawPart(PlantContext context, RandomSequence random) {
    int leafSegments = 16;
    float leafLength = 2;
    float leafWidth = 1.5;
    
    float upTilt = 0.3;

    fill(50,200,60);  
    noStroke();
    
    beginShape(TRIANGLES);
    
    for (int i = 0; i < leafSegments; i++) {
      float relPos = map(i, 0, leafSegments, 0f, 1f);
      float nextRelPos = map(i + 1, 0, leafSegments, 0f, 1f);
      
      leafEdgePoint(relPos, 0.5*leafWidth, leafLength, upTilt, p1);  
      leafCenterPoint(relPos, leafLength, p2);
      leafCenterPoint(nextRelPos, leafLength, p3);
      addTriangle(p1, p2, p3);

      leafCenterPoint(nextRelPos, leafLength, p1);
      leafEdgePoint(nextRelPos, 0.5*leafWidth, leafLength, upTilt, p2);  
      leafEdgePoint(relPos, 0.5*leafWidth, leafLength, upTilt, p3);  
      addTriangle(p1, p2, p3);
      
      leafCenterPoint(relPos, leafLength, p1);
      leafEdgePoint(relPos, -0.5*leafWidth, leafLength, upTilt, p2);  
      leafCenterPoint(nextRelPos, leafLength, p3);
      addTriangle(p1, p2, p3);

      leafEdgePoint(nextRelPos, -0.5*leafWidth, leafLength, upTilt, p1);  
      leafCenterPoint(nextRelPos, leafLength, p2);
      leafEdgePoint(relPos, -0.5*leafWidth, leafLength, upTilt, p3);  
      addTriangle(p1, p2, p3);
      
    }
    
    endShape();

  }
  
  void leafCenterPoint(float relPos, float leafLen, PVector pos) {
      float y = mix(relPos, 0, leafLen);
      pos.x = 0;
      pos.y = y;
      pos.z = 0;
  }
  
  void leafEdgePoint(float relPos, float leafR, float leafLen, float upTilt, PVector pos) {
       float cutoverPoint = 0.8;
      float baseW = pow(mapClamp(relPos, 0, cutoverPoint, 0, 1), 0.5);
      float tipW = 0.5*(1+cos(TURN*mapClamp(relPos, cutoverPoint, 1, 0, 1)*0.5));
      float w = mix(relPos, baseW, tipW);
      
      float x = 0.5*leafR * w;
      float z = 0 + upTilt * abs(leafR) * sin(0.5*TURN*min(relPos, 1-relPos));
      float y = mix(relPos, 0, leafLen);
      
      pos.x = x;
      pos.y = y;
      pos.z = z;
 }
  
}
