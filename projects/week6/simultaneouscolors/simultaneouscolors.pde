Swatch swatch;
int HSB_MAX = 100; 

ArrayList<Swatch> swatches; 

void setup(){
  size(800,800);
  stroke(255);
  strokeWeight(2);
  
  swatches = new ArrayList<Swatch>();
  int h = round(random(0,100));
  int s = round(random(0,100));
  int b = round(random(0,100));
  PVector n = new PVector(5, 5); 
  PVector m = new PVector(width-5, height-5); 
  PVector t = new PVector(5, height-5); 
  PVector[] v = new PVector[]{n,m};
  swatch = new Swatch(v, h, s, b);
  
  swatches.add(swatch);


}

void draw(){
  colorMode(RGB,255);
  background(255);
  for(int i=0;i<swatches.size();i++){
    swatches.get(i).draw();
  }
 
}


// mouseClicked --> select or deselect swatch
void mouseClicked(){
   // If there is a previously selected swatch, deselect it 
   for(int i= swatches.size()-1;i>=0;i--){
      Swatch s = swatches.get(i);
      if (s.selected == true) { 
        // println("deselected", i); 
        s.selected = false;
        return; 
      }
   }
   // If no swatch is previously selected and there is a hit, select the swatch
   for(int i= swatches.size()-1;i>=0;i--){
      Swatch s = swatches.get(i);
      if (s.hitTest(mouseX, mouseY)) {
        // println("selected", i); 
        s.selected = true; 
        return; 
      }
   }
   deselectAllSwatches(); 
}

// mouseDragged --> update brightness (xy) of swatch
void mouseDragged(){
   PVector delta = new PVector(mouseX-pmouseX,mouseY-pmouseY);
   // For every swatch, check if its selected
   // and update color according to distance moved 
   for(int i=0;i<swatches.size();i++){
     Swatch s = swatches.get(i);
     if(s.selected == true){
         // println("mousePressed", mousePressed); 
         s.updateColor(delta);
       return;
     }  
   }   
}

// mouseMoved --> update hue (x) and saturation(y) of swatch
void mouseMoved(){
   PVector delta = new PVector(mouseX-pmouseX,mouseY-pmouseY);
   // For every swatch, check if its selected
   // and update color according to distance moved 
   for(int i=0;i<swatches.size();i++){
     Swatch s = swatches.get(i);
     if(s.selected == true){
         s.updateColor(delta);
       return;
     }  
   }   
}

// press 'c' --> print color of swatch
// press 's' --> split swatch
// press 'b' --> black
// press 'w' --> white
// press 'd' --> download / save scheme 
int count = 0; 
void keyPressed() {
  println("keyPressed: ", key);
  // For every swatch, choose if selected 
  for(int i=0;i<swatches.size();i++){
     Swatch s = swatches.get(i);
     if(s.selected == true) {
         // If key == 'p', print color of any selected swatch
         if (key == 'p') { // Print 
           color c = s.getColor(); 
           println("(" + red(c) + ", " + green(c) + ", " + blue(c) + ")"); 
         }
         if (key == 's') { // Split
           s.split(); 
           swatches.remove(s); 
         }
         if (key == 'b') { // Black
           s.bri = 0; 
         }
         if (key == 'w') { // White
           s.sat = 0; 
           s.bri = HSB_MAX;
         }
         if (key == 'd') {
           save("scheme"+count+".jpg"); 
           count++; 
         }
       return;
     }  
   }   
}

void deselectAllSwatches(){
   for(int i=0;i<swatches.size();i++){
      swatches.get(i).selected = false;
   }
}
