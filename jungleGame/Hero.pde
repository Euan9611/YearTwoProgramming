class Hero {
  // member variables
  int x, y, w, h;
  float health;
  //color c;
  PImage Hero;

  // constructor
  Hero(int x, int y) {
    this.x =x;
    this.y =y;
    w = 20;
    h = 20;
    health = 1000;
    Hero = loadImage("theHero.png");
  }

  // display method
  void display(int tempX, int tempY) {
    imageMode(CENTER);
    x = tempX;
    y = tempY;
    image(hero, x, y);
  }
}
