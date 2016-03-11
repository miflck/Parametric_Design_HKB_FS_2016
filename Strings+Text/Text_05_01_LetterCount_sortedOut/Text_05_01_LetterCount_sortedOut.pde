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
color []colors=new color[alphabet.length()];

int [] counter=new int[alphabet.length()];




int index = 0;

float posx=0;
float posy=0;
float lineheight=40;
int leading=20;


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
  
  // Array mit Farben im Verlauf füllen
  colorMode(HSB, alphabet.length());
  for (int i=0; i<alphabet.length(); i++) {
    colors[i]=color(i, 255, 255);
  }
  colorMode(RGB, 255);
  
  
}

void draw() {

  background(255);

  pushMatrix();
  translate(0, 50);
  color myColor=color(0, 20);
  posx=0;
  posy=textAscent()+textDescent();

  for (int i=0; i<alphabet.length(); i++) {
    char c = alphabet.charAt(i); 
        myColor=getColor(c);

    for (int k=0; k<counter[i]; k++) {
    
  

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
}
  popMatrix();
}


void countThisChar(char c) {
  int index=alphabet.indexOf(c);
  println(index);
  if (index>=0)counter[index]+=1; // wenns nicht im alphabet ist, ignorieren
}



// Farbe des Buchstabens finden
color getColor(char c) {
  color myColor=color(255);
  for (int i=0; i<alphabet.length(); i++) {
    if (Character.toLowerCase(c)==alphabet.charAt(i)) {
      myColor=colors[i];
      return color(myColor);
    }
  }
  return color(255, 0, 0);
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