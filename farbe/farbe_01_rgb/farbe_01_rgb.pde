void setup() {
  size(255, 255);
}

void draw() {
  for (int i=0; i<255; i++) {
    stroke(i, 0, 0);
    line(i, 0, i, 125);
  }

  for (int i=0; i<255; i++) {
    stroke(i, 255-i, 0);
    line(i, 125, i, 255);
  }
}