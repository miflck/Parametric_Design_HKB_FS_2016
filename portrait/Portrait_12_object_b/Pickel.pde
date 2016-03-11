class Pickel {

  float posx=0;
  float posy=0;
  float size=1;
  int col=color(255, 0, 0);
  float growfakt;

  Pickel(float _posx, float _posy) {
    posx=_posx;
    posy=_posy;
    growfakt=random(1, 1.05);
  }

  void grow() {
    size=size*growfakt;
    if (size>10) {
      size=1;
    }
  }

  void draw() {
    pushStyle();
    pushMatrix();
    translate(posx, posy);
    fill(col);
    noStroke();
    ellipse(0, 0, size, size);
    popMatrix();
    popStyle();
  }
}