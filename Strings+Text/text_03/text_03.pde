/* 
 *  Text 03
 *  Text einlesen, in Farbe übersetzen etc. 
 *  HKB 16 Parametric Design, MR
 */
String[] lines;
int index = 0;

float posx=0;
float posy=0;
float rectsize=12;
float lineheight=rectsize*1.3;
PFont font;


void setup() {
  size(1000, 1200);
  lines = loadStrings("text.txt");
  font=createFont("Helvetica",20);
  textFont(font,15);

  background(0);
  noStroke();
  colorMode(HSB);

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
  background(0);
  posx=0;
  posy=0;

  for (int i=0; i<lines.length; i++) {
    String line=lines[i];
    posx=0;

    for (int h=0; h<line.length(); h++) {
      char c=line.charAt(h);
      
      
       
       // Step1
       
      float hue=map((int)c, 40, 130, 0, 255);
      fill(hue, 255, 255);
      if (hue>10) {
        rect(posx, posy, rectsize, rectsize);
      }
      
      // Step 2      
      fill(255);
      if(c=='D' || c=='d'){
        text('D',posx, posy+rectsize);  
      }
      if(c=='A' || c=='a'){
        text('A',posx, posy+rectsize);
      }
      
      
 
      posx+=rectsize;
      if (posx+rectsize>=width) {
        posx=0;
        posy+=lineheight;
      }
    }

    posy+=lineheight;
  }
}