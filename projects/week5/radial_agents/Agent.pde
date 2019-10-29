class Agent {
  ArrayList<DShape> shapes; 
  int linecount; 
  int totalTheta; 
  float xoff; 
  float yoff; 
  R reflect;
  float xplay; 
  float yplay; 
  
  Agent() {
    xoff = 0; 
    yoff = 0;  
    linecount = _linecount; 
    totalTheta = _totalTheta; 
    shapes = new ArrayList<DShape>();
    reflect = R.NONE; 
    xplay = 1; 
    yplay = 1; 
  }
  
  Agent(float _xoff, float _yoff, R _reflect, float _xplay, float _yplay) {
    xoff = _xoff; 
    yoff = _yoff; 
    linecount = _linecount; 
    totalTheta = _totalTheta; 
    shapes = new ArrayList<DShape>();
    reflect = _reflect; 
    
    xplay = _xplay; 
    yplay = _yplay; 
  }
  
  void drawRadial() {
    fft.analyze(spectrum); 
    float r = 0; float g = 0; float b = 0; 
    for (int i = 0; i < bands; i++) {
      if (i%3 == 0) r += map(spectrum[i], 0, 0.01, 0, 255); 
      if (i%3 == 1) g += map(spectrum[i], 0, 0.01, 0, 255); 
      if (i%3 == 2) b += map(spectrum[i], 0, 0.01, 0, 255); 
    } 
    r *= (1/5.0); 
    g *= (1/5.0);
    b *= (1/6.0);
    drawingManager.stroke(floor(r), floor(g), floor(b));
    if (shapes.size() < 1) return; 
    for(int i = 0; i < linecount; i++){
       DShape shape = shapes.get(i);
       shape.addVertex(mouseX+xoff,mouseY+yoff);
     }
  }
  
  void clearRadial() {
    shapes.clear(); 
  }
  
  void createRadial() {
    // Set stroke based on shape scale -- use average of dimensions 
    drawingManager.strokeWeight(1/((xplay+yplay)/2)); 
    // Use a loop to create a new set of shapes
    for(int i = 0; i<linecount;i++){
      
      // Initialize a new DShape object
      DShape s = drawingManager.addShape(); 
      // Add it to the list of shapes
      shapes.add(s);
      
      if (reflect == R.X) {
        s.translate(width, 0); 
        s.scale(-1,1); 
        // s.translate(-width,0);
        // s.scale(scalex, 1); 
      }
      
      if (reflect == R.Y) {
        s.translate(0, height); 
        s.scale(1, -1); 
      }
      
      if (reflect == R.XY) {
        s.translate(width, height); 
        s.scale(-1, -1); 
      }
      
      // Perform a matrix transformation to rotate the shape using the mouseX and mouseY as the origin points
      s.translate((mouseX+xoff),(mouseY+yoff));
      s.rotate(radians((totalTheta/linecount*i)));
       
      s.scale(xplay, yplay);
      
      // Move back to the origin after rotation
      s.translate(-(mouseX+xoff),-(mouseY+yoff));
    }
    
  }
  
}
