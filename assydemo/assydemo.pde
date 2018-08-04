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
int CANVAS_WIDTH = 1920; //480;
int CANVAS_HEIGHT = 1080; // 360;
//int CANVAS_WIDTH = 800;
//int CANVAS_HEIGHT = 600;

int fps = 60;

// For syncing with music etc
Moonlander moonlander;

// Camera
//QueasyCam cam;
Camera camera;

PVector camPos = new PVector(20, -10, 10);
PVector focusPos = new PVector(0,-5,0);


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
  fullScreen(P3D);
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


  // Parameters: 
  // - PApplet
  // - soundtrack filename (relative to sketch's folder)
  // - beats per minute in the song
  // - how many rows in Rocket correspond to one beat
  moonlander = Moonlander.initWithSoundtrack(this, "babbys_first_pumpkin_patch.mp3", 222, 8);
//  moonlander.changeLogLevel(Level.FINEST);

  // Last thing in setup; start Moonlander. This either
  // connects to Rocket (development mode) or loads data 
  // from 'syncdata.rocket' (player mode).
  // Also, in player mode the music playback starts immediately.
  //moonlander.start("localhost", 9001, "syncfile");
  moonlander.start();
  
  setupPlants();


  
}



void draw() {
  background(0);
  fill(255);
  //resetShader();

  
  // Handles communication with Rocket
  moonlander.update();

  int stopNow = moonlander.getIntValue("stopNow");
  if (stopNow >= 1) {
    exit();
  }

  // Seconds since start
  float time = (float) moonlander.getCurrentTime();
//  float time = millis() / 1000.0;
  float deltaTime = 1f / fps; 

  
  float cameraSpeed = (float)moonlander.getValue("camera:speed");
  float cameraDistance = (float)moonlander.getValue("camera:distance");
  float cameraFocusHeight = (float)moonlander.getValue("camera:focusHeight");

  camPos.x = cameraDistance * cos(TURN*time*cameraSpeed);
  camPos.z = cameraDistance * sin(TURN*time*cameraSpeed);
  camPos.y = (float)moonlander.getValue("camera:height");

  camera.jump(camPos.x, camPos.y, camPos.z);
  camera.aim(focusPos.x, focusPos.y + cameraFocusHeight, focusPos.z);
  camera.feed();
  
  // Debug lines
  noStroke();
 // stroke(0,255, 0);
 
// resetShader();
  //lights();

  // Sunlight
  float sunWorbleAmount = (float) moonlander.getValue("sun:worbleAmount");
  float sunWorbleSpeed = (float) moonlander.getValue("sun:worbleSpeed");
  worblePos += deltaTime*sunWorbleSpeed;  
  directionalLight(255, 200, 50, sin(worblePos)*sunWorbleAmount, -1, -cos(worblePos)*sunWorbleAmount);

  // Skylight
  directionalLight(20, 40, 140, 0,-1,0);
  ambientLight(30,50,80);

  // Doom Light
   directionalLight(200, 50, 10, 0.2,0.1,0.1);

  // Update plants
  treeAge = (float) moonlander.getValue("plants:tree");
  singleGrassAge = (float) moonlander.getValue("plants:singleGrass");
  singleFlowerAge = (float) moonlander.getValue("plants:singleFlower");

  grassPatchAge = (float) moonlander.getValue("plants:grassPatch");
  flowerPatchAge = (float) moonlander.getValue("plants:flowerPatch");

  
  fill(255, 255, 255);

  drawPlants(time);
  
  noStroke();

}
