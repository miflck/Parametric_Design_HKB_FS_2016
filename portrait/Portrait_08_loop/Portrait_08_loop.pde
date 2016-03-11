/* 
*  Portrait 08 Loop
*  Loopen mit for(…){}
*
*  HKB 16 Parametric Design, MR
*/

int dicke=100;
int mitteX;
int mitteY;
int anzahlHaare=30;

// Setup Funktion, wird einmal aufgerufen
void setup(){ 
   size(500,500);
   mitteX=width/2;
   mitteY=height/2;  
    
}


// Draw Funktion, wird geloopt
void draw(){

  background(0);
  stroke(0);
  arc(mitteX, 250, dicke*1.5, 150, -PI, 0, OPEN);
  ellipse(mitteX,mitteY-100,100,100);
  rect(mitteX-dicke/2,mitteY,dicke,150);
  rect(mitteX-dicke*3/4,mitteY,dicke/4,150);
  rect(mitteX+dicke/2,mitteY,dicke/4,150);
  
  stroke(150);
  for(int i=0;i<anzahlHaare;i++){ 
    float startx=mitteX-dicke/2;
    float abstand=dicke/float(anzahlHaare); // ! Division durch Floatingpoint != Division durch Integer
    float xpos=startx+i*abstand;
    line(xpos, 100,xpos,140);    
  }
}