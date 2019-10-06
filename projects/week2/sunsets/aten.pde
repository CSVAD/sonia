//pshape tiling
PShape tile;

float rW = 160; // 80, 160 
float rH = 160; // 80, 160 

// For scales, use the following: 
// 4.57, 40, aten3 or aten || 3.95, 80, aten3 or aten || 3.36, 160, aten3 or aten 

void setup() {
  int W = 800; int H = 800; 
  size(800,800); 
  
  // style properties
  background(255);
  noStroke();
  
  // initialize circles
  float d0 = W/3.36; 
  float y0 = d0/2; 
  float x0 = d0/2; 

  float x = x0; 
  float y = y0; 
  
  // grid helpers 
  float d = d0; 
  float yrow = y0; 
  int idx = 0; 

  // draw grid of circles
  while (yrow < H+d) {
    // modulate color 
    float alpha = 255 - 255*yrow/(2*H); 
    // row helpers 
    float xrow = y; 
    // draw a row of circles
    while (x < W+d) {
      if (idx == 0) { // drawing first circle 
        x = (float) Math.random()*x/2;
      } 
      idx++; 
      fill(255, 164, 255*Math.abs(sin(PI*yrow/H)),(int) alpha);
      circle(x,yrow,d);
      x += 2*xrow; 
    }
    idx = 0; 
    yrow += y; // clear bottom half
    d *= 0.8; 
    x = d/2; 
    yrow += d/2;
    y = d/2; 
  }
  
  // Aten tile grid 
  tile = loadShape("aten3.svg");  
  noFill();
  tile.setStroke(color(247, 193, 200));
  int count = 0; 
  for (int j=0; j<height/rH; j++) {
    for (int i=0; i<width/rW; i++) {
      // Add rotation 
      float r = getRotation(count); 
      drawSeed(i*rW, j*rH, r/2);
      count++; 
    }
  }
  
  save("aten3.jpg");
  
}

void draw() {
  
}

float getRotation(int count) {
  float r = 0; 
  int p = count % 4; 
  if (p == 0) r = 0; 
  if (p == 1) r = PI/2; 
  if (p == 2) r = PI; 
  if (p == 3) r = PI/2 + PI; 
  return r; 
}

void drawSeed(float x, float y, float r) {
  pushMatrix();
  translate(x+rW/2, y+rH/2);
  rotate(r);
  noFill();
  shape(tile,0,0,rW,rH);

  popMatrix();
}
