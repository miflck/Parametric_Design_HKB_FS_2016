/* 
 *  Portrait 11
 *  Externe Funktion, Pickel zeichnen
 *  HKB 16 Parametric Design, MR
 */

int dicke=150;

int mitteX;
int mitteY;

int numpickels=50;

float [] posx=new float[numpickels];
float [] posy=new float[numpickels];
int [] col=new int[numpickels];

// Setup Funktion, wird einmal aufgerufen
void setup() { 
  size(500, 500);
  mitteX=width/2;
  mitteY=height/2;
  
  for(int i=0;i<numpickels;i++){
    posx[i]=random(-50,50);
    posy[i]=random(-50,250);
    col[i]=color(random(150,255),random(0,50),random(0,50));
  }
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
   pushMatrix();
   translate(mitteX, mitteY-100);
   for(int i=0;i<numpickels;i++){
     drawPickel(posx[i], posy[i],col[i]);
   }
   popMatrix();

}


// Externe Funktion mit Parametern:
void drawPickel(float posx, float posy, int col){
  pushStyle();
  noStroke();
  pushMatrix();
  translate(posx, posy);
  fill(col,50);
  ellipse(0,0,12,12);
  ellipse(0,0,10,10);
  fill(col);
  ellipse(0, 0, 5, 5); 
  popMatrix();
  popStyle();
}