/* 
 *  Text 06
 *  Textobjekt
 
 *  HKB 16 Parametric Design, MF
 */


PFont font;  // PFont Variable definieren
String[] lines;
String joinedText;


PVector[] positions;
PVector offset=new PVector(0, 100);
Letter [] letters;


int index = 0;

float posx=0;
float posy=0;
float lineheight=40;
int leading=20;

boolean debug=true;

void setup() {
  size(800, 800);
  frameRate(30);
  background(0);

  lines = loadStrings("text.txt");
  joinedText = join(lines, " "); 

  // Font stuff
  font = loadFont ("HelveticaNeue-48.vlw");
  textFont(font, 30);  
  textLeading(leading);

  // Letterobjekte kreieren
  positions=new PVector[joinedText.length()];
  letters=new Letter[joinedText.length()];
  posx=0;
  posy=0;
  lineheight=textAscent()+textDescent();
  for (int i=0; i<joinedText.length(); i++) {
    char c = joinedText.charAt(i); 
    positions[i]=new PVector(posx, posy);
    letters[i]=new Letter(c, posx, posy);
    letters[i].offset=offset;
    posx+=textWidth(c);
    if (posx > width-textWidth(c)) {
      posx=0;
      posy+=lineheight+leading;
    }
  }
}

void draw() {

  background(255);
  pushMatrix();
  translate(offset.x, offset.y);
  for (int i=0; i<letters.length; i++) {
    letters[i].display();
  }
  popMatrix();
}




void keyPressed() {
  if (key == 'd') {
    debug = !debug;
  }

  if (key == '-') {
    offset.y-=10;
    for (int i=0; i<letters.length; i++) {
      letters[i].offset=offset;
    }
  }
}