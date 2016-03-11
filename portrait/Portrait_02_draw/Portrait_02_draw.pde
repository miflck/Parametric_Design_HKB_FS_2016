/* 
*  Portrait 02
*  Zeichenfunktionen
*  HKB 16 Parametric Design, MR
*/

// Setup Funktion, wird einmal aufgerufen
void setup(){ 
  size(500,500);  
}


// Draw Funktion, wird geloopt
void draw(){
  
  background(200);
 
  arc(250, 250, 150, 150, -PI, 0, CLOSE); // Schulter
  ellipse(250,150,100,100); // Kopf
 
  // Gesicht
  triangle(250,150,255,165,245,165);
  line(220,150,235,150);
  line(265,150,280,150);

  rect(200,250,100,150); // Bauch
  rect(175,250,25,150); // linker Arm
  rect(300,250,25,150); // rechter Arm
 
}