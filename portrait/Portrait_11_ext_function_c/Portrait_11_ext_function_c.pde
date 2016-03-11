/* 
 *  Portrait 11
 *  Externe Funktion, Pickel zeichnen
 *  HKB 16 Parametric Design, MR
 */

int dicke=150;

int mitteX;
int mitteY;


// Setup Funktion, wird einmal aufgerufen
void setup() { 
  size(500, 500);
  mitteX=width/2;
  mitteY=height/2;
}


// Draw Funktion, wird geloopt
void draw() {
  background(0);

  arc(mitteX, mitteY, dicke*1.5, 150, -PI, 0, OPEN); // Schulter
  ellipse(mitteX, mitteY-100, 100, 100); // Kopf
  rect(mitteX-dicke/2, mitteY, dicke, 150); // Bauch
  rect(mitteX-dicke/2-dicke/4, mitteY, dicke/4, 150); // linker Arm
  rect(mitteX+dicke/2, mitteY, dicke/4, 150); // rechter Arm

  // Pickel zeichnen
   drawPickel(mitteX, mitteY-100,color(255,100,0));
   drawPickel(mitteX+10, mitteY-90,color(200,0,100));
   drawPickel(mitteX-20, mitteY-120, color(255,0,0));
   
}


// Externe Funktion mit Parametern:
void drawPickel(float posx, float posy, int col){
  pushStyle();
  fill(col);
  noStroke();
  pushMatrix();
  translate(posx, posy);
  ellipse(0, 0, 5, 5);
  popMatrix();
  popStyle();
}