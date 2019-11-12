import grid.library.*;

Grid grid; 

void setup() {
  size(800, 800); 
  
  // Set-up grid 
  grid = new Grid(this); 
  grid.setGridLineColorTo(255);
  grid.setUseXYTo(false); 
  grid.setUseRadialTo(true);
  grid.setGridAngularIntervalTo(15); 
  grid.setGridLineBaseThicknessTo(1.2);
}

void draw() {
  background(0);
  
  // Face shape
  noStroke();
  fill(100, 100, 100);
  circle(width/2,height/2,600);
  
  // Nose
  rectMode(CENTER);
  fill(25,24,27);
  rect(width/2,height/2-60, 60, 400);
  
  // Mouth
  fill(255,114,54);
  rect(width/2, height/2+200, 60, 40);
  
  // Eyes
  fill(194, 184, 180);
  rect(width/2-140, height/2-30, 150, 40);
  rect(width/2+140, height/2-30, 150, 40);
  fill(230,185,155);
  circle(width/2-120, height/2-30, 60);
  circle(width/2+120, height/2-30, 60);
  
  grid.drawGrid();
}
