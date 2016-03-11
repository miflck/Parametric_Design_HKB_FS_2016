/* 
 *  Text 02
 *  Text einlesen
 
 *  HKB 16 Parametric Design, MR
 */


PFont font;  // PFont Variable definieren


String[] lines;
String joinedText;

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


  for (int i = 0; i < lines.length; i++) {
    println(lines[i]);
    String line=lines[i];
    for (int h=0; h<line.length(); h++) {
      println(line.charAt(h));
      println((int)line.charAt(h));
    }
  }
}

void draw() {
  textFont(font, 30);      // Font und Grösse angeben
  background(0);

  color myColor=color(255);
  posx=0;
  posy=textAscent()+textDescent();

  for (int i=0; i<joinedText.length(); i++) {
    char c = joinedText.charAt(i); 
    myColor=getColor(c);
    
    pushMatrix();
    translate(posx, posy);
    noStroke();
    fill(myColor);
    rect(0, -lineheight, textWidth(c), lineheight);
    fill(0);
   if (debug) text(c, 0, 0);
    popMatrix();
    posx+=textWidth(c);
    if (posx>width-textWidth(c)) { // umbruch vor Canvasende
      posx=0;
      posy+=lineheight+leading;
    }//end if
  }// end text
}


// Farbe des Buchstabens finden
color getColor(char c) {
  color myColor=color(255);
  for (int i=0; i<letterOrder.length(); i++) {
    if (Character.toLowerCase(c)==letterOrder.charAt(i)) {
      myColor=colors[i];
      return color(myColor);
    }
  }
  return color(255, 0, 0);
}


void keyPressed() {
  if(key == 'd'){
     debug = !debug;
  }
  
  if(key == '-'){
   leading--;
  }
  
  if(key == '+'){
   leading++;
  }
  
}