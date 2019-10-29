import drawing.library.*;
import processing.pdf.*;
import processing.sound.*;

DrawingManager drawingManager;

AudioIn in;
Amplitude loudness;
FFT fft; 
int bands = 16; 
float[] spectrum = new float[bands]; 

// Total number of lines to be drawn
int _linecount = 8; 
// Total angle to rotate lines by
int _totalTheta = 360;
// Background 
int BACKGROUND = 40; 

// Rotation
enum R {
  NONE, X, Y, XY; 
}
int nreflectmodes = 3; 

// List of agents
ArrayList<Agent> agents = new ArrayList<Agent>();
// Number of agents 
int nmaxagents = 6; 
int nagents = 0; 

void setup() {
  size(1500, 1500, P3D);
  background(BACKGROUND);
  smooth();
  
  // Drawing Manager 
  drawingManager = new DrawingManager(this);
  
  // Audio input and grab the 1st channel
  in = new AudioIn(this, 0);
  in.start(); 
  // Amplitude analyzer 
  loudness = new Amplitude(this);
  loudness.input(in); 
  // FFT analyzer
  fft = new FFT(this, bands); 
  fft.input(in); 
  

  // Make human agent 
  agents.add(new Agent()); 
  // Add autonomous agents 
  updateAgents(); 
}

void draw() {
}

void keyPressed() {
  if (key == 's') {
    drawingManager.savePDF();
    save("im_pavane.jpg"); 
  }
  if (key == 'c') {
    drawingManager.clear();
    background(BACKGROUND); 
  }
}

// Draw radial agents with mouse movement 
void mouseMoved() {
  for (int i = 0; i < nagents; i++) {
    Agent a = agents.get(i);  
    a.drawRadial();
  }
}

// Start and stop drawing radial agents 
int mouse_click = 1; 
void mouseClicked() {
  updateAgents(); 
  
  for (int i = 0; i < nagents; i++) {
    Agent a = agents.get(i); 
    a.clearRadial();
  }
  // Start drawing radials every other click 
  if (mouse_click % 2 != 0) {
    for (int i = 0; i < nagents; i++) {
      Agent a = agents.get(i); 
      a.createRadial();
    }
  }
  mouse_click++; 
  // Integer overflow...0.0
  if (mouse_click == Integer.MAX_VALUE) mouse_click = 1;
}

void updateAgents() {
  // Clear agents except for human 
  Agent human = agents.get(0); 
  agents.clear(); 
  agents.add(human); 
  
  // Create random agents 
  nagents = floor((float)Math.random()*(nmaxagents)); 
  for (int i = 0; i < nagents; i++) {
    float l = map(loudness.analyze(), 0, 1, 1, 10); 
    float x = (float) Math.random()*l*3 - 10;
    float y = (float) Math.random()*l*3 - 10; 
    R reflect = getReflection(floor((float) Math.random()*(nreflectmodes+1)));  
    float xplay = l;  
    float yplay = noise(mouseX, mouseY);  
    agents.add(new Agent(x, y, reflect, xplay, yplay));
  }
  nagents = agents.size(); 
}

R getReflection(int i) {
  R reflect = R.NONE; 
  if (i == 0) reflect = R.X; 
  if (i == 1) reflect = R.Y; 
  if (i == 2) reflect = R.XY; 
  return reflect; 
}
