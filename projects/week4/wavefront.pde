// --------------------------------------------------------------------------------------------
// wavefront
// Sonia Hashim
//
// Inspired by -- Noise Wave by Daniel Shiffman.
// https://processing.org/examples/noisewave.html
// --------------------------------------------------------------------------------------------
import controlP5.*;
ControlP5 cp5;
// --------------------------------------------------------------------------------------------
PShape wave;
ArrayList<Wave> waves;
float[] velocities;
// --------------------------------------------------------------------------------------------
class Wave{
  PShape wave;
  float[] velocities;
  float y1range;
  float y2range;

  Wave(float _y1range, float _y2range) {
    y1range = _y1range;
    y2range = _y2range;
    // Create wave shape
    wave =  createShape();
    wave.beginShape();
    wave.vertex(width, 0);
    wave.vertex(0,0);
    float xoff = (float)Math.random();       // Option #1: 2D Noise
    // Iterate over horizontal pixels
    float ymax = 0;
    for (float x = 0; x <= width; x += 10) {
      // Calculate a y value according to noise, map to
       float vnoise = noise(xoff);
       float y = map(vnoise, 0, 0.5, y1range, y2range);
      // Set the vertex
      wave.vertex(x, y);
      // Increment x dimension for noise
      xoff += 0.05;
      ymax = max(y, ymax);
    }
    wave.endShape(CLOSE);
    // Update velocities
    int nverts = wave.getVertexCount();
    velocities = new float[nverts];
    for(int i= 0; i < nverts; i++) {
      if (i == 0 || i == 1) velocities[i] = 0;
      else velocities[i] = 1;
    }
  }

  void update_wave() {
    int nverts = wave.getVertexCount();
    float yavg = 0;
    for (int i = 2; i < nverts; i++) {
      PVector v = wave.getVertex(i);
      v.y -= velocities[i];
      velocities[i] += .0001*(v.y - y1range);
      wave.setVertex(i, v);
      yavg += v.y;
    }
    yavg /= nverts;
    float c = 10+200*yavg/height;
    wave.setFill(color(0, 0.5*c, c, 50));
  }

}
// --------------------------------------------------------------------------------------------
int wavecount = 10;
float yt = 300;
float yb = 600;
int noctaves = 6;
float noctcontrib = .2;

Controller countslider;
Controller ytslider;
Controller ybslider;
Controller noctavesslider;
Controller noctcontribslider;
CallbackListener cb;
// --------------------------------------------------------------------------------------------
void setup() {
  size(800, 800);
  noStroke();

  // GUI
  cp5 = new ControlP5(this);
  countslider = cp5.addSlider("wavecount")
    .setPosition(25, 25)
    .setRange(1, 25)
    ;
  ytslider = cp5.addSlider("yt")
    .setPosition(25, 25*2)
    .setRange(100, 400)
    ;
  ybslider = cp5.addSlider("yb")
    .setPosition(25, 25*3)
    .setRange(400, 750)
    ;
  noctavesslider = cp5.addSlider("noctaves")
    .setPosition(25, 25*4)
    .setRange(3, 8)
    ;
  noctcontribslider = cp5.addSlider("noctcontrib")
    .setPosition(25, 25*5)
    .setRange(.1, .6)
    ;

  cb = new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      switch(theEvent.getAction()) {
        case(ControlP5.ACTION_ENTER):
          break;
        case(ControlP5.ACTION_RELEASED):
          createWaves(); break;
        case(ControlP5.ACTION_RELEASEDOUTSIDE):
          createWaves(); break;
         default:
          break;
      }
    }
  };
  countslider.addCallback(cb);
  ytslider.addCallback(cb);
  ybslider.addCallback(cb);
  noctavesslider.addCallback(cb);
  noctcontribslider.addCallback(cb);

  createWaves();
}
// --------------------------------------------------------------------------------------------
void draw() {
  background(255);
  for(int i = 0; i < waves.size(); i++) {
    Wave w = waves.get(i);
    shape(w.wave);
    w.update_wave();
  }
}
// --------------------------------------------------------------------------------------------
void createWaves() {
  // Create waveforms
  waves = new ArrayList<Wave>();
  for (int i = 0; i < wavecount; i++) {
    float g = (float) Math.random()*.2;
    noiseDetail(noctaves, noctcontrib);
    float y1 = (float)(yt+randomGaussian()*20);
    float y2 = (float)(yb+randomGaussian()*20);
    Wave w = new Wave(y1, y2);
    waves.add(w);
}
}
