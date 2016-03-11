/* 
 *  Portrait 03
 *  Einfache Variablen
 *  HKB 16 Parametric Design, MR
 */

int dicke=150;

int mitteX;
int mitteY;

int numpickel=50;
Pickel [] pickel=new Pickel[numpickel];

// Setup Funktion, wird einmal aufgerufen
void setup() { 
  size(500, 500);
  mitteX=width/2;
  mitteY=height/2;

  for (int i=0; i<numpickel; i++) {
    pickel[i]=new Pickel(mitteX+random(-50, 50), mitteY-100+random(-50, 50));
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

  for (int i=0; i<numpickel; i++) {
    pickel[i].grow();
  }

  for (int i=0; i<numpickel; i++) {
    pickel[i].draw();
  }
}