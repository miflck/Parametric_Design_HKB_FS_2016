//Klassenblock
class Letter {


  //Eigenschaften / Variabeln
  PVector position=new PVector(0, 0);
  PVector offset=new PVector(0, 0);

  color myGrey=255;
  char myChar;
  float myWidth;
  float myHeight;

  float myRotation=0;


  // Konstruktor
  Letter(char _myChar, float _posx, float _posy) {
    myChar = _myChar;
    position.x=_posx;
    position.y=_posy;
    myWidth=textWidth(myChar);
    myHeight=textAscent()+textDescent();
  }

  // 
  void display() {
    pushStyle();
    pushMatrix();
    translate(position.x, position.y);
    if (isMouseOver()) {
      myGrey=0;
    } else {
      //fill(myColor);
    }
    fill(myGrey);
    //rotate(radians(myRotation));

    text(myChar, 0, 0);
    //ellipse(0, 0, size, size);
    popMatrix();
    popStyle();
  }

  boolean isMouseOver() {
    println(offset);
    if (mouseX-offset.x>position.x && mouseX-offset.x<position.x+myWidth && mouseY-offset.y >position.y-myHeight && mouseY-offset.y < position.y) {
      return true;
    } else {
      return false;
    }
  }

  void setOffset(PVector _offset) {
    offset=_offset;
  }
}