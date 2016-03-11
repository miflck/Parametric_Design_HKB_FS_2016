/* 
 *  Text 02
 *  Text einlesen
 
 *  HKB 16 Parametric Design, MF
 */


PFont font;  // PFont Variable definieren


String[] lines;
String joinedText;

//Sortierter String, gegen den abgeglichen werden kann 
String alphabet ="abcdefghijklmnopqrstuvwxyz ,.;:\"«»";

int [] counter=new int[alphabet.length()];




int index = 0;

float posx=0;
float posy=0;
float lineheight=40;
int leading=5;


boolean debug=false;


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

  for (int i=0; i<joinedText.length(); i++) {
    char c = joinedText.charAt(i); 
    countThisChar(c);
  }

  println(counter);
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
    float factor;
    if (index>=0) {
      factor=map(counter[index], 0, 70, 5, 48);
    } else {
      factor=10;
    }
    textFont(font, factor);      // Font und Grösse angeben
      lineheight=textAscent()+textDescent();
   myColor=(int)c;

    pushMatrix();
    translate(posx, posy);
    noStroke();
    fill(myColor);
    rect(0, -lineheight, textWidth(c), lineheight);
    fill(0);
    if (debug) text(c, 0, 0);
    popMatrix();
    posx+=textWidth(c);

    if (posx > width-textWidth(c)) { // umbruch vor Canvasende
      posx=0;
      posy+=lineheight+leading;
    }
  }

  popMatrix();
}


void countThisChar(char c) {
  int index=alphabet.indexOf(c);
  println(index);
  if (index>=0)counter[index]+=1; // wenns nicht im alphabet ist, ignorieren
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