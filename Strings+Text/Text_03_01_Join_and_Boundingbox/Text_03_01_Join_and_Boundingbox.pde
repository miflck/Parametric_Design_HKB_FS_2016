/* 
 *  Text einlesen
 
 *  HKB 16 Parametric Design, MF
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


//Sortierter String, gegen den abgeglichen werden kann 
String letterOrder ="abcdefghijklmnopqrstuvwxyz ,.;:\"«»";
// Array für den Farbverlauf



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
  background(255);

  color myColor=color(255,0,0);
  posx=0;
  posy=textAscent()+textDescent();

  for (int i=0; i<joinedText.length(); i++) {
    char c = joinedText.charAt(i); 
    noStroke();
    fill(myColor);
    stroke(0);
    rect(posx, posy-lineheight, textWidth(c), lineheight);
    fill(0);
    text(c, posx, posy);
    posx+=textWidth(c);
    if (posx>width-textWidth(c)) { // umbruch vor Canvasende
      posx=0;
      posy+=lineheight+leading;
    }//end if
  }// end text
}