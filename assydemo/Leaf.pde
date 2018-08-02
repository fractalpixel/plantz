
class Leaf extends PlantPart {
  
  
  
  void doInit(RandomSequence random) {
  }
  
  void drawPart(PlantContext context, RandomSequence random) {
    int leafSegments = 25;
    float leafLength = 20;
    float leafWidth = 20;
    
    float upTilt = 0.3;

    fill(50,200,60);
    
    beginShape(TRIANGLES);
    for (int i = 0; i < leafSegments; i++) {
      float relPos = map(i, 0, leafSegments, 0f, 1f);
      float nextRelPos = map(i + 1, 0, leafSegments, 0f, 1f);
      
      leafEdgePoint(relPos, 0.5*leafWidth, leafLength, upTilt);  
      leafCenterPoint(relPos, leafLength);
      leafCenterPoint(nextRelPos, leafLength);

      leafCenterPoint(nextRelPos, leafLength);
      leafEdgePoint(nextRelPos, 0.5*leafWidth, leafLength, upTilt);  
      leafEdgePoint(relPos, 0.5*leafWidth, leafLength, upTilt);  
      
      leafCenterPoint(relPos, leafLength);
      leafEdgePoint(relPos, -0.5*leafWidth, leafLength, upTilt);  
      leafCenterPoint(nextRelPos, leafLength);

      leafEdgePoint(nextRelPos, -0.5*leafWidth, leafLength, upTilt);  
      leafCenterPoint(nextRelPos, leafLength);
      leafEdgePoint(relPos, -0.5*leafWidth, leafLength, upTilt);  
      
    }
    
    endShape();

  }
  
  void leafCenterPoint(float relPos, float leafLen) {
      float y = mix(relPos, 0, leafLen);
      vertex(0,y,0);
  }
  
  void leafEdgePoint(float relPos, float leafR, float leafLen, float upTilt) {
       float cutoverPoint = 0.4;
      float baseW = pow(mapClamp(relPos, 0, cutoverPoint, 0, 1), 0.5);
      float tipW = 0.5*(1+cos(TURN*mapClamp(relPos, cutoverPoint, 1, 0, 1)*0.5));
      float w = mix(relPos, baseW, tipW);
      
      float x = 0.5*leafR * w;
      float z = 0 + upTilt * abs(leafR) * min(relPos, 1-relPos);
      float y = mix(relPos, 0, leafLen);
      
      vertex(x,y,z);
 }
  
}
