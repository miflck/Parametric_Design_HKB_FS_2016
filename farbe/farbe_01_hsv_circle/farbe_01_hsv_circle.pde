
void setup() {
  size(255, 255); 
  colorMode(HSB);
  
}

void draw() {
  background(255);
  for (int i=0; i<255; i++) {
    stroke(i, 255, 255);
    noFill();
    ellipse(128, 128, i, i);
  }
}