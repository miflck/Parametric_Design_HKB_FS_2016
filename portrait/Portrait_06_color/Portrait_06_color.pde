/* 
*  Portrait 06
*  Farbe!
* 
*  und unterwegs: map, float
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
  
  
  fill(150,40,90);
  arc(mitteX, 250, dicke+2*armdicke, 150, -PI, 0, OPEN);
  
  fill(255,255, 155);
  ellipse(mitteX,mitteY-100,100,100);
  
  fill(#ff3399);  
  rect(mitteX-dicke/2,mitteY,dicke,150);
  fill(20,30,140);
  
  
  rect(mitteX-dicke/2-armdicke,mitteY,armdicke,150);
  rect(mitteX+dicke/2,mitteY,armdicke,150);

}