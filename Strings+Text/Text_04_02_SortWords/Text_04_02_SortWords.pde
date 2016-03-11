/* 
 *  Text 02
 *  Text einlesen
 
 *  HKB 16 Parametric Design, MR
 */


PFont font;  // PFont Variable definieren


String[] lines;
String joinedText;
String[] words; 
String[] sortedWords; 



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
  words=joinedText.split(" ");
  sortedWords=sort(words);



  // Font stuff
  font = loadFont ("HelveticaNeue-48.vlw");
  textFont(font, 30);  
  textLeading(leading);
  lineheight=textAscent()+textDescent();




  for (int i = 0; i < sortedWords.length; i++) {
    println(sortedWords[i]);
  }
}

void draw() {

  textFont(font, 30);      // Font und Grösse angeben
  background(255);

  color myColor=color(0, 20);
  int spacing=20;
  posx=0;
  posy=textAscent()+textDescent();

  for (int i=0; i<sortedWords.length; i++) {
    String word  = sortedWords[i]; 
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