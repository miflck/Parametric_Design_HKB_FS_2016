
void setup() {
  size(255, 255); 
  colorMode(HSB);
}

void draw() {
  for (int i=0; i<255; i++) {
    stroke(i, 255, 255);
    line(i, 0, i, 125);
  }

  for (int i=0; i<255; i++) {
    stroke(i/6.0, 255, 255);
    line(i, 125, i, 255);
  }
}