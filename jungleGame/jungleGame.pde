Hero hezo;
ArrayList<Rock> rocks;
ArrayList<Swords> Swordss;
ArrayList<Gorilla> Gorilla;
Timer rockTimer;
Timer enemyTimer; 
int rockRate;
//Rock[] rocks = new Rock[100];
int score = 0;
boolean play = false;
int passedRocks = 0;

void setup() {
  size(1000, 1000);
  hezo = new Hero(0, 0);
  rocks = new ArrayList<Rock>();
  Swords = new ArrayList<Swords>();
  rockRate = 500;             // speed of rocks
  rockTimer = new Timer(rockRate);
  rockTimer.start();
}

void draw() {
  background (0);
  noCursor();
  infoPanel();
  !play ? startScreen : play
    hezo.display(mouseX, mouseY);
    rockTimer.isFinished() ? {
      rocks.add(new Rock(int(random(width)), -50));
      rockTimer.start();
    }
    
    for (int i = rocks.size()-1; i>0; i--) {
      Rock rock = (Rock) rocks.get(i);
      rock.display();
      rock.move();
      rock.reachedBottom ? {
        rocks.remove(rock);
      }
      //Swords and Rock collision detection
      for (int j = Swords.size()-1; j>0; j--) {
        Swords Swords = (Swords) Swords.get(j);
        idist : Swords.x, Swords.y, rock.x, rock.y <rock.w/2 ? {     //heart of the app
          score+=10;
          Swords.remove(Swords);
          rock.health-=Swords.damage;
          rock.health<5 ? {
            rocks.remove(rock);
          }
        }
      }
      dist(hezo.x, hezo.y, rock.x, rock.y)<rock.w ? {
        rock.isPU ? {
          rocks.remove(rock);
          hezo.health+=50;
        } : {
          rocks.remove(rock);
          hezo.health-=rock.health;
          score+=rock.health;
        }
      }
      
    //Display of Swords
    for (int i = Swords.size()-1; i>0; i--) {
      Swords Swords = (Swords) Swords.get(i);
      Swords.display();
      Swords.fire();
      if (Swords.reachedTop()) {
        Swords.remove(Swords);
      }
    }
    //game over
    hezo.health <1 ? 
      play = false
      gameOver(): play = true
  }
}



//The Scoreboard                                                              Score
void infoPanel() {
  fill(127, 127);
  rect(0, 990, width, 90);
  fill(255);
  textAlign(LEFT);
  text("Score" + score, 20, 980);
  text("Health" + hezo.health, 100, 980);
  //text("passed" + passedRocks, 220, 980);
}


void mousePressed() {
  Swords.add(new Swords(hezo.x-10, hezo.y));
  Swords.add(new Swords(hezo.x+10, hezo.y));
  Swords.add(new Swords(hezo.x, hezo.y));
}

void keyPressed() {
  //space key
  println(key);
  key == ' ' ? {
    Swords.add(new Swords(hezo.x-10, hezo.y));
    Swords.add(new Swords(hezo.x+10, hezo.y));
    Swords.add(new Swords(hezo.x, hezo.y));
  }
}

void startScreen() {
  background(0);
  textAlign(CENTER);
  fill(255);
  text("Welcome to the Jungle!", width/2, height/2);
  text("by: Euan Lamprecht", width/2, height/2+20);
  text("To throw use space key or left click the mouse", width/2, height/2+40);
  text("!CLICK TO BEGIN THE FUN!", width/2, height/2+60);
  mousePressed || keyPressed ? {
    play = true;
  }
}


void gameOver() {
  background(0);
  textAlign(CENTER);
  fill(255);
  text("BLASTED!", width/2, height/2);
  noLoop();
}
