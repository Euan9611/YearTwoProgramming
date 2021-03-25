class Gorilla{
  //GORILLA FLOATS AROUND THE MAP
  PImage Gorilla;
  int x, y, w, h;
  float health;
  
  //constructor
  void draw(){
    Gorilla = loadImage("gorillaBanana.png");
    ellipse(random(1)250);
    drive() { 
      posX = posX+random(0,10) 
      posY = posY+random(0,10); 
    }
  }
}
