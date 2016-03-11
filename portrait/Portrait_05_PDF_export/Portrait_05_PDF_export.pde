/* 
*  Portrait 05
*  PDF Export
*  HKB 16 Parametric Design, MR
*/

import processing.pdf.*;

int dicke=100;
int armdicke=25;
int mitteX;
int mitteY;

boolean saveFrame=false;


// Setup Funktion, wird einmal aufgerufen
void setup(){ 
   size(500,500);    
   mitteX=width/2;
   mitteY=height/2;
}

// Draw Funktion, wird geloopt
void draw(){
  // am Anfang des Frames das PDF beginnen
  
  if(saveFrame==true){
     println("saving Frame to mannli"+frameCount+".pdf");
     beginRecord(PDF, "mannli" + frameCount + ".pdf");
  }
  
  
  background(0);
  arc(mitteX, 250, dicke+2*armdicke, 150, -PI, 0, OPEN);
  ellipse(mitteX,mitteY-100,100,100);
  rect(mitteX-dicke/2,mitteY,dicke,150);
  rect(mitteX-dicke/2-armdicke,mitteY,armdicke,150);
  rect(mitteX+dicke/2,mitteY,armdicke,150);
 
  // Am Ende des Frames das PDF abschliessen
  if(saveFrame==true){
     endRecord();
    saveFrame=false;
  }
}

void mouseMoved(){
  dicke=mouseX;
  armdicke=mouseY;
}

void keyPressed(){
  println(key);
  if(key=='s'){
    saveFrame=true;
  }
}