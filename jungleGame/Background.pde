void setup() {
  //RECURSION METHOD.. WORKS?
  size(640, 360);
  noStroke();
  noLoop();
}

void draw() {
  drawSquare(base/2, 280, 6);
  PImage staticl = loadImage("backgroundJungle.png");
}

void drawSquare(int x, int height, int level) {                    
  float tt = 100 * level/4.0;
  fill(tt);
  ellipse(x, height/2, height*2, height*2);      
  level > 1 ? {
    drawSquare(x - height/2, height/2, level);
    drawSquare(x + height/2, height/2, level);
    level = level - 1;
  }
}
