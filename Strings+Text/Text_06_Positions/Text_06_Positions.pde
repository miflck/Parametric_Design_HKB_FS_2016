/* 
 *  Text 02
 *  Text einlesen
 
 *  HKB 16 Parametric Design, MR
 */


PFont font;  // PFont Variable definieren


String[] lines;
String joinedText;
//Sortierter String, gegen den abgeglichen werden kann 
String alphabet ="abcdefghijklmnopqrstuvwxyz ,.;:\"«»";

int [] counter=new int[alphabet.length()];

PVector[] positions;



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


  for (int i=0; i<alphabet.length(); i++) {
    counter[i]=0;
  }

  positions=new PVector[joinedText.length()];

  posx=0;
  posy=0;
  textFont(font, 30);
  lineheight=textAscent()+textDescent();
  for (int i=0; i<joinedText.length(); i++) {
    char c = joinedText.charAt(i); 
    positions[i]=new PVector(posx, posy);
    posx+=textWidth(c);
    if (posx > width-textWidth(c)) {
      posx=0;
      posy+=lineheight+leading;
    }
  }

  println(positions);
}

void draw() {

  background(255);
  pushMatrix();
  translate(0, 50);
  color myColor=color(0, 20);
  posx=0;
  posy=textAscent()+textDescent();

  for (int i=0; i<joinedText.length(); i++) {
    char c = joinedText.charAt(i); 
    int index=alphabet.indexOf(c);
    pushMatrix();
    translate(positions[i].x, positions[i].y);
    noStroke();
    fill(0);
    if (debug) text(c, 0, 0);
    popMatrix();
  }

  popMatrix();
}




void keyPressed() {
  if (key == 'd') {
    debug = !debug;
  }

  if (key == '-') {
    leading--;
  }

  if (key == '+') {
    leading++;
  }
}