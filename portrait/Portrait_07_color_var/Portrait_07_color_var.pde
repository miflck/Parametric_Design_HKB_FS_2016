/* 
*  Portrait 07
*  
*  HSV (Hue Saturation Value) == HSB (Hue Saturation Blackness)
*  https://en.wikipedia.org/wiki/HSL_and_HSV
* 
*  HKB 16 Parametric Design, MR
*/


int dicke=100;
int armdicke=25;
int mitteX;
int mitteY;

float anger=0;
float mood=0;

// Setup Funktion, wird einmal aufgerufen
void setup(){ 
   size(500,500);    
   mitteX=width/2;
   mitteY=height/2;
}

// Draw Funktion, wird geloopt
void draw(){
  background(0);
  
  fill(200);
  arc(mitteX, 250, dicke+2*armdicke, 150, -PI, 0, OPEN);
  
  colorMode(RGB);
  fill(255,255-anger, 255-anger);
  
  colorMode(HSB);
  fill(mood,anger, 255);
  ellipse(mitteX,mitteY-100,100,100);
  
  fill(150);
  rect(mitteX-dicke/2,mitteY,dicke,150);
  rect(mitteX-dicke/2-armdicke,mitteY,armdicke,150);
  rect(mitteX+dicke/2,mitteY,armdicke,150);

}

void mouseMoved(){
  anger=map(mouseY, 500,0,0,255);
  mood=map(mouseX,0,500,0,255);
  
  /*
  print("anger="+anger);
  println("mood="+mood); 
  */
}