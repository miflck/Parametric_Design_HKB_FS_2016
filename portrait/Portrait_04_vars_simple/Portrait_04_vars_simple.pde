/* 
*  Portrait 04
*  Einfache Variablen mehrere
*  HKB 16 Parametric Design, MR
*/

int dicke=100;
int armdicke=25;

int mitteX;
int mitteY;


// Setup Funktion, wird einmal aufgerufen
void setup(){ 
   size(500,500);    
   mitteX=width/2;
   mitteY=height/2;
}


// Draw Funktion, wird geloopt
void draw(){
  background(0);
  arc(mitteX, 250, dicke+2*armdicke, 150, -PI, 0, OPEN);
  ellipse(mitteX,mitteY-100,100,100);
  rect(mitteX-dicke/2,mitteY,dicke,150);
  rect(mitteX-dicke/2-armdicke,mitteY,armdicke,150);
  rect(mitteX+dicke/2,mitteY,armdicke,150);
}

void mouseMoved(){
  dicke=mouseX;
  armdicke=mouseY;
}