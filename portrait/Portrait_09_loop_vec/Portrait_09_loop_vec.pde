/* 
 *  Portrait 09
 *  Loop für die Haare, drehen pushMatrix/popMatrix, pushStyle/popStyle
 *  HKB 16 Parametric Design, MR
 */

int dicke=100;
int mitteX;
int mitteY;
int anzahlHaare=100;

// Setup Funktion, wird einmal aufgerufen
void setup() { 
  size(500, 500);
  mitteX=width/2;
  mitteY=height/2;
  colorMode(HSB);
}

// Draw Funktion, wird geloopt
void draw() {

  background(0);
  stroke(0);
  arc(mitteX, 250, dicke*1.5, 150, -PI, 0, OPEN);

  pushStyle();
  pushMatrix();
  stroke(255);
  strokeWeight(2);
  translate(mitteX, mitteY-100);
  float startangle=-180;
  rotate(radians(startangle));
  float angle=180.0/float(anzahlHaare-1);
  for (int i=0; i<anzahlHaare; i++) { 
    float hue=i%255;
    float len=(sin(i/10.0))*30+150; 
    
    stroke(hue,255,255);
    line(0, 0, 100, 0);    
    rotate(radians(angle));
  }
  popMatrix();
  popStyle();

  ellipse(mitteX, mitteY-100, 100, 100);
  rect(mitteX-dicke/2, mitteY, dicke, 150);
  rect(mitteX-dicke*3/4, mitteY, dicke/4, 150);
  rect(mitteX+dicke/2, mitteY, dicke/4, 150);
}


void mouseMoved() {
  anzahlHaare=mouseX;
}