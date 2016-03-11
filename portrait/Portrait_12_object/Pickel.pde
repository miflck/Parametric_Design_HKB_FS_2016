class Pickel {

  float posx=0;
  float posy=0;
  float size=5;
  int col=color(255, 0, 0);

  Pickel(float _posx, float _posy) {
    posx=_posx;
    posy=_posy;
  }

  void draw() {
    pushStyle();
    pushMatrix();
    translate(posx, posy);
    fill(col);
    ellipse(0, 0, size, size);
    popMatrix();
    popStyle();
  }
}