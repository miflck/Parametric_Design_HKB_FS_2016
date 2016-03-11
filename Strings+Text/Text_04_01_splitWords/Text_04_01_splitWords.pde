/* 
 *  Text einlesen
 
 *  HKB 16 Parametric Design, MF

 */


PFont font;  // PFont Variable definieren


String[] lines;
String joinedText;
String[] words; 


int index = 0;

float posx=0;
float posy=0;
float rectsize=30;
float lineheight=40;
int leading=20;


boolean debug=false;

//Sortierter String, gegen den abgeglichen werden kann 
String letterOrder ="abcdefghijklmnopqrstuvwxyz ,.;:\"«»";
// Array für den Farbverlauf
color []colors=new color[letterOrder.length()];



void setup() {
  size(800, 800);
  frameRate(30);
  background(0);

  lines = loadStrings("text.txt");
  joinedText = join(lines, " "); 
  words=joinedText.split(" ");



  // Font stuff
  font = loadFont ("HelveticaNeue-48.vlw");
  textFont(font, 30);  
  textLeading(leading);
  lineheight=textAscent()+textDescent();



  // Array mit Farben im Verlauf füllen
  colorMode(HSB, letterOrder.length());
  for (int i=0; i<letterOrder.length(); i++) {
    colors[i]=color(i, 255, 255);
  }
  colorMode(RGB, 255);


  for (int i = 0; i < words.length; i++) {
    println(words[i]);
  }
}

void draw() {

  textFont(font, 30);      // Font und Grösse angeben
  background(0);

  color myColor=color(255);
  int spacing=20;
  posx=0;
  posy=textAscent()+textDescent();

  for (int i=0; i<words.length; i++) {
    String word  = words[i]; 
    pushMatrix();
    translate(posx, posy);
    noStroke();
    fill(myColor);
    rect(0, -lineheight, textWidth(word), lineheight);
    fill(0);
    if (debug) text(word, 0, 0);
    popMatrix();

    posx+=textWidth(word);
    posx+=spacing;

    if (posx > width-textWidth(word)) { // umbruch vor Canvasende
      posx=0;
      posy+=lineheight+leading;
    }
  }
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