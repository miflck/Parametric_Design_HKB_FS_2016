/* 
 *  Text einlesen
 
 *  HKB 16 Parametric Design, MF
 */


PFont font;  // PFont Variable definieren

void setup() {
  size(400, 400);
  // Laden der Schrift  
  font = loadFont ("HelveticaNeue-48.vlw");
  textLeading(textAscent()+4);
}

void draw() {
  background(255);
  textFont(font, 30);                  // Font und Grösse angeben

  String message = "Hello World!";
  pushMatrix();
  translate(0, textAscent()+textDescent());
  for (int i=0; i<message.length(); i++) {
    char c = message.charAt(i);  
    noFill();
    stroke(255, 0, 0);
    rect(0, -textAscent()-textDescent(), textWidth(c), textAscent()+textDescent());
    fill(0);
    text(c, 0, 0);
    translate(textWidth(c), 0);
  }
  popMatrix();
}