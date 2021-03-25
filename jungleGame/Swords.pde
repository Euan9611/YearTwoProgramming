class Swords {
  int x, y, w, h, speed, r;
  //color c;
  PImage Swords;
  int damage;

  //constuctor
  Swords(int x, int y) {
    this.x = x;
    this.y = y;
    w = 10;
    h = 20;
    speed = 12;
    damage = int(random(50,52));
    r = 5;
    //c = color(255, 0, 0);
    Swords = loadImage("godlySword.png");
  }
  //fire method
  void fire() {
    y-=speed;
  }
  //INHERITANCE CLASS... WORKS?
  Sword h;
  void setup() {
    size(10,20);
    h = new Sword(intHero);
  }
  void draw() {
    h.jiggle(); //makes the SWORD "jiggle" when moving!
  }
  
  //display method
  void display() {
    imageMode(CENTER);
    image(Swords,x,y);
  }

  //reached top
   boolean reachedTop() {
    y<-50 ? {
      return true :
      return false
    }
  }
  
}
