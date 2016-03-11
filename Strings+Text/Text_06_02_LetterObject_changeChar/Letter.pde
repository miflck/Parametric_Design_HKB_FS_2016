//Klassenblock
class Letter {


  //Eigenschaften / Variabeln
  PVector position=new PVector(0, 0);
  color myColor=color(random(255), random(255), random(255));
  char myOriginalChar;
  char myChar;

  float myWidth;
  float myHeight;



  // Konstruktor
  Letter(char _myChar, float _posx, float _posy) {
    myOriginalChar = _myChar;
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
    //int r=int(random(10, 50));
    if (isMouseOver()) {
      //if (frameCount% r==0) {
      myChar=char(int(random(33,126)));
      myWidth=textWidth(myChar);
    }

    //}
    fill(0);
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