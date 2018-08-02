import damkjer.ocd.*;

//import queasycam.*;
import moonlander.library.*;
import java.util.logging.*;


// Minim is needed for the music playback
// (even when using Moonlander)
import ddf.minim.*;

float TURN = PI*2;

float worblePos = 0f;

// These control how big the opened window is.
// Before you release your demo, set these to 
// full HD resolution (1920x1080).
//int CANVAS_WIDTH = 1920; //480;
//int CANVAS_HEIGHT = 1080; // 360;
int CANVAS_WIDTH = 800;
int CANVAS_HEIGHT = 600;

int fps = 60;

// For syncing with music etc
// Moonlander moonlander;

// Camera
//QueasyCam cam;
Camera camera;

PVector camPos = new PVector();
PVector focusPos = new PVector();


float sinNoise(float t, float x) {
  return 0.5*sin(t * x) + 0.5*cos(t * 0.31232 * x) + 0.5*sin( (t * 0.123 + cos(t * 0.001351)) * 0.871 * x);
}

float shakyNoise(float time, float freq, float bass, float discant, float seed) {
  return (noise(time * 0.2*freq, seed * 123.321) * 2 - 1) * bass +
         (noise(time * 1*freq, seed * 887.213) * 2 - 1) * discant; 
}

/*
 * settings() must be used when calling size with variable height and width
 */
void settings() {
  // Set up the drawing area size and renderer (P2D / P3D).
  size(CANVAS_WIDTH, CANVAS_HEIGHT, P3D);
//  fullScreen(P3D);
  randomSeed(8719);
  noiseSeed(2131);

}


void setup() {
  noSmooth();
  noCursor();
  
  rectMode(CENTER);
  
  translate(width /2, height/2);
  scale(height / 1000.0);
  
  // Setup camera
  camera = new Camera(this, -20, 0, 0);
  camera.aim(0,0,0);
  camera.feed();
  
  frameRate(fps);

//  moonlander.start();
  
  setupPlanz();


  
}



void draw() {
  background(0);
  fill(255);
  resetShader();

  
  // Handles communication with Rocket
  //moonlander.update();

  int stopNow = 0; //moonlander.getIntValue("stopNow");
  if (stopNow >= 1) {
    exit();
  }

  // Seconds since start
//  float time = (float) moonlander.getCurrentTime();
  float time = millis() / 1000.0;
  float deltaTime = 1f / fps; 

  camera.jump(camPos.x, camPos.y, camPos.z);
  camera.aim(focusPos.x, focusPos.y, focusPos.z);
  camera.feed();
  
  // Debug lines
  noStroke();
 // stroke(0,255, 0);

    // Sunlight
  float sunWorbleAmount = 0.5f;//(float) moonlander.getValue("sunWorbleAmount");
  float sunWorbleSpeed = 0.5f;//(float) moonlander.getValue("sunWorbleSpeed");
  worblePos += deltaTime*sunWorbleSpeed;
  directionalLight(255, 255, 255, sin(worblePos)*sunWorbleAmount, 10, cos(worblePos)*sunWorbleAmount);
  fill(100, 200, 255);

  drawPlannz();

  noStroke();

}
