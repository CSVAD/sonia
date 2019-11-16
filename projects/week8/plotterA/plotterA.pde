import processing.pdf.*;
size(792,612);

String pdf_name = "out_one_row.pdf";
beginRecord(PDF, pdf_name); 
noFill();
background(255);

translate(width/6, height/3);
strokeWeight(2);
PShape t = createShape(); 
t.beginShape();
t.vertex(0,-43.5);
t.vertex(-50,43.5);
t.vertex(50,43.5);
t.endShape(CLOSE);

float r = 29*2;
pushMatrix(); 
for(int i = 0; i < 13; i++) {  
  translate(50,0);
  pushMatrix(); 
  rotate(i*PI/6);
  shape(t, 0, 0); 
  popMatrix();
  scale(0.95);
}
//popMatrix(); 

//translate(0, height/3);
//pushMatrix(); 
//scale(0.5);
//for(int i = 0; i < 13; i++) {
//  translate(50,0);
//  pushMatrix(); 
//  rotate(i*PI/6);
//  shape(t, 0, 0); 
//  popMatrix();
//  scale(1.05);
//}
//popMatrix();


  
endRecord();
