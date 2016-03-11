//Klassenblock
class Letter {


  //Eigenschaften / Variabeln
  PVector position=new PVector(0, 0);
  color myColor=color(random(255), random(255), random(255));
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
      fill(255, 0, 0);
      myRotation++;
     
    } else {
      fill(myColor);
    }
      rotate(radians(myRotation));

    text(myChar, 0, 0);
    //ellipse(0, 0, size, size);
    popMatrix();
    popStyle();
  }

  boolean isMouseOver() {
    if (mouseX>position.x && mouseX<position.x+myWidth && mouseY >position.y-myHeight && mouseY < position.y ) {
      return true;
    } else {
      return false;
    }
  }
}