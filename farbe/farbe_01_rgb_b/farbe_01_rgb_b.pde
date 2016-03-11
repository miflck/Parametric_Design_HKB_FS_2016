void setup() {
  size(255, 255);
}

void draw() {
  for (int i=0; i<255; i++) {
    for (int h=0; h<255; h++) {
      stroke(i, h, 255-h);
      point(i, h);
    }
  }
}