/* 
 WS Parametric Design 2016
 Typografie
 
 
 //--------------------------------------------------
 */

PFont font;  // PFont Variable definieren

String data[]; 
ArrayList<PVector> positions = new ArrayList<PVector>();

float xTextPosition;
int yTextPosition;
int leading=10;

float angle=0;

void setup() {
  size(800, 800);
  // Laden der Schrift  
  font = loadFont ("HelveticaNeue-48.vlw");
  data=loadStrings("data.txt");
  println(data);
}



void draw() {
  background(255);
  textFont(font, 20);  
  textLeading(leading);

  pushMatrix();
  translate(width/2, height/2);
  xTextPosition=0;
  yTextPosition=0;
  angle=map(mouseX, 0 , (float)width, -10 , 10);
  for (int i=0; i<data.length; i++) { // Alle Zeilen durchgehen
    for (int k=0; k<data[i].length(); k++) { // Alle Buchstaben der Zeile durchgehen
      char c = data[i].charAt(k);  
      translate(xTextPosition, yTextPosition);
      rotate(radians(angle));
      noFill();
      stroke(255, 0, 0);
      fill(0);
      text(c, 0, 0);
     xTextPosition=textWidth(c);      
    }
  }

  popMatrix();
}