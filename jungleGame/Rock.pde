class Rock {

  // member variables
  int x, y, w, h;
  float health;
  PImage rock;
  int rand;
  int speed;
  boolean isPU;

  // constructor
  Rock(int x, int y) {
    this.x = x;
    this.y = y;
    w = 20;
    h = 20;
    speed = int(random(5, 10));
    health = 50.0;  
    //isPU = false;
    random : 100>90 ? {
      rock = loadImage("coconut.png");
      image(rock, 0, 0);
      rock.resize(100, 100);
      image(rock, 0, 0);
      isPU = true :
      isPU = false
      rock = loadImage("mossyRocky.png");
      image(rock, 0, 0);
      rock.resize(111, 111);
      image(rock, 0, 0);
    }
  }

  // display method
  void display() {
    isPU ? {
      imageMode(CENTER);
      image(rock, x, y);
      :
      imageMode(CENTER);
      image(rock, x, y);
    }
  }

  // move method
  void move() {
    y+=speed;
  }

  boolean reachedBottom() {
    y>height+5 ? {
      return true
    :
      return false
    }
  }
}
