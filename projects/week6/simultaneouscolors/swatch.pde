 enum Shape {
   SQUARE, TRIANGLE; 
 }
 
class Swatch{
 int swatchWidth;
 int swatchHeight;
 PVector position;
 int hue;
 int sat;
 int bri;
 int order;
 boolean selected;
 char shape; 
 PVector[] verts; 
 Shape swatch;
 
 PVector tl; 
 PVector br; 
 
 PVector p0; 
 PVector p1; 
 PVector p2; 
 
 Swatch(PVector[] v, int h, int s, int b){
   verts = v; 
   hue = h; 
   sat = s; 
   bri = b; 
   selected = false;
   
   if (verts.length == 2) {
     swatch = Shape.SQUARE; 
     tl = verts[0];
     br = verts[1]; 
   }
   
   if (verts.length == 3) {
     swatch = Shape.TRIANGLE; 
     p0 = verts[0]; 
     p1 = verts[1]; 
     p2 = verts[2]; 
   }
 }
 
 // CCW orientation test 
 float ccw(PVector a, PVector b, PVector c) {
   return (b.x-a.x)*(c.y-a.y) - (c.x-a.x)*(b.y-a.y);
 }
 
  boolean hitTest(int x,int y){
    if (swatch == Shape.SQUARE) {
      if (x>=tl.x && x<=br.x && y>=tl.y && y <= br.y)
        return true; 
    }
    if (swatch == Shape.TRIANGLE) {
      PVector p = new PVector(x, y); 
      float ccw_p0p1p2 = ccw(p0, p1, p2);
      float ccw_p0p1p = ccw(p0, p1, p);
      float ccw_p1p2p = ccw(p1, p2, p); 
      float ccw_p2p0p = ccw(p2, p0, p);
      
      if ( (ccw_p0p1p2 >= 0 && ccw_p0p1p >= 0 && ccw_p1p2p >= 0 && ccw_p2p0p >= 0)
        || (ccw_p0p1p2 <= 0 && ccw_p0p1p <= 0 && ccw_p1p2p <= 0 && ccw_p2p0p <= 0)) 
        return true; 
    }
    return false; 
  }
 
 void moveBy(PVector delta){
    position.add(delta); 
 }
 
 void updateColor(PVector delta){
   if (mousePressed)
    { bri += delta.x; bri -= delta.y; }
   else { 
     hue += delta.x;
     sat -= delta.y;
   }

 }
 
 void generateSwatch(PVector[] v, boolean useOriginal) {
   if (useOriginal) {
     swatches.add(new Swatch(v, hue, sat, bri)); 
   } else {
   int h = hue + round(randomGaussian()*0.25*HSB_MAX); 
   int s = sat + round(randomGaussian()*0.1*HSB_MAX);  
   int b = bri + round(randomGaussian()*0.1*HSB_MAX);  
   swatches.add(new Swatch(v, h, s, b)); 
   }
 }
 
 void split() {
   if (swatch == Shape.SQUARE) {
     // Get probability for split 
     // (60% squares, 20% normal triangles, 20% goofy triangles)
     float prob = (float) Math.random(); 
     if (swatches.size() == 1 || prob <= .2) {
       // Split into 4 squares 
       float d = (br.x - tl.x)/2; 
       int nsquares = 0; 
       for (float x = tl.x; x < br.x; x += d) {
         for (float y = tl.y; y < br.y; y+= d) {
           PVector tl_prime = new PVector(x,y); 
           PVector br_prime = new PVector(x+d, y+d); 
           PVector[] v = new PVector[]{tl_prime, br_prime};
           if (nsquares == 0) generateSwatch(v, true); 
           else generateSwatch(v, false); 
           nsquares++; 
         }
       }
     } else if (prob > .2 && prob <= .6) {
       // Split into 2 triangles goofy 
       PVector a = new PVector(br.x, tl.y); 
       PVector b = new PVector(tl.x, br.y); 
       PVector[] v1 = new PVector[]{b, tl, a}; 
       PVector[] v2 = new PVector[]{a, br, b}; 
       generateSwatch(v1, true); 
       generateSwatch(v2, false); 
     } else if (prob > .6) {
       // Split into 2 triangles normal 
       PVector a = new PVector(br.x, tl.y); 
       PVector b = new PVector(tl.x, br.y); 
       PVector[] v1 = new PVector[]{tl, a, br}; 
       PVector[] v2 = new PVector[]{br, b, tl}; 
       generateSwatch(v1, true); 
       generateSwatch(v2, false); 
     }
   }
   if (swatch == Shape.TRIANGLE) {
     PVector x = new PVector(p0.x + 0.5*(p2.x - p0.x), p0.y + 0.5*(p2.y - p0.y)); 
     PVector[] v1 = new PVector[]{p1, x, p0}; 
     PVector[] v2 = new PVector[]{p2, x, p1}; 
     generateSwatch(v1, true); 
     generateSwatch(v2, false); 
   }
 }
 
 color getColor() {
   colorMode(HSB, HSB_MAX); 
   return color(hue, sat, bri); 
 }
 
 void draw(){
   colorMode(RGB,255);
   if(selected){
     strokeWeight(3); 
   }
   else{
     strokeWeight(2);
   }
   
   colorMode(HSB, 100);
   fill(hue,sat,bri);
   
   if (swatch == Shape.SQUARE) {
     rect(tl.x, tl.y, br.x - tl.x, br.y - tl.y);
   }
   
   if (swatch == Shape.TRIANGLE) {
     triangle(p0.x, p0.y, p1.x, p1.y, p2.x, p2.y); 
   }
 }
 
 
}
