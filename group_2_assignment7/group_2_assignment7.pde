Goalie g1;
int goalie = 0;
int player = 0;

int scoreStore = 0;
float vxStore = 0;
float vyStore = 0;

Player p1;

Ball b1;

void setup(){
  size(1000, 750);
  background(255);
  
  g1 = new Goalie(120, 415, 130, 475, 20, 1.5);
  
  p1 = new Player(750, 450, 5, 10);
  
  b1 = new Ball(750, 455, 20, -2.5, -0.5);
}

void draw(){
  background(255);
  
  //drawing the goal
  strokeWeight(6);
  line(100, 275, 100, 475);
  line(0, 475, 100, 475);
  noFill();
  bezier(0, 475, 25, 400, 25, 275, 100, 275);
  strokeWeight(1);
  //horizontal net lines
  line(8, 450, 100, 450);
  line(11, 425, 100, 425);
  line(16, 400, 100, 400);
  line(22, 375, 100, 375);
  line(28, 350, 100, 350);
  line(36, 325, 100, 325);
  line(50, 300, 100, 300);
  //vertical net lines
  line(75, 280, 75, 475);
  line(50, 300, 50, 475);
  line(25, 375, 25, 475);
  
  if (scoreStore < goalie + player) {
    delay(3000);
  }
  if ((goalie == 10) || (player == 10)) {
    delay(7000);
    exit();
  }
  
  scoreStore = goalie + player;
  
  g1.display();
  g1.move();
  
  b1.display();
  b1.move();
  
  p1.display();
  
  if (b1.vx < 0) {
    if ((b1.x > g1.x+(b1.size/2)) && (b1.x < g1.x2+(b1.size/2)) && (b1.y > g1.y) && (b1.y < g1.y2)) {
      b1 = new Ball(b1.x, b1.y, b1.size, -b1.vx, b1.vy);
    }
    
    if ((b1.x < 90) && (b1.x > 75) && (b1.y > 275) && (b1.y < 475)) {
      player += 1;
      textSize(45);
      text("PLAYER HAS SCORED! NEXT ROUND TO START!", 50, 200);
      b1 = new Ball(p1.x, p1.y, b1.size, b1.vx, -(b1.vy+2));
    }
  }
  
  if (b1.vx > 0) {
    if (b1.x > width - (b1.size*2)) {
      goalie += 1;
      textSize(45);
      text("GOALIE HAS SCORED! NEXT ROUND TO START!", 50, 200);
      b1 = new Ball(p1.x, p1.y, b1.size, -b1.vx, b1.vy+2);
    }
  }
  
  //GUI interface
  textSize(32);
  text("Goalie: " + goalie, width * (3/4), 30);
  text("Player: " + player, width * (3/4), 60);
  
  if (player == 10) {
    textSize(45);
    text("GAME HAS ENDED. PLAYER HAS WON!", 100, 600);
  }
  if (goalie == 10) {
    textSize(45);
    text("GAME HAS ENDED. GOALIE HAS WON!", 100, 600);
  }
}

void keyPressed() {
  if (keyCode == UP) {
    p1.move(true, false);
    if (b1.vx == 0) {
      b1 = new Ball(b1.x, b1.y - p1.playerSpeed, b1.size, b1.vx, b1.vy);
    }
  }
  if (keyCode == DOWN) {
    p1.move(false, true);
    if (b1.vx == 0) {
      b1 = new Ball(b1.x, b1.y + p1.playerSpeed, b1.size, b1.vx, b1.vy);
    }
  }
  
  if (key == 'a') {
    if ((abs(b1.x - p1.x) < 20) && abs(b1.y - p1.y) < 20) {
      if (b1.vx != 0) {
        vxStore = b1.vx;
        vyStore = b1.vy;
      }
      b1 = new Ball(b1.x, b1.y, b1.size, 0, 0);
    }
  }
  if (key == 'd') {
    if (b1.vx == 0) {
      b1 = new Ball(b1.x, b1.y, b1.size, -vxStore, vyStore);
    }
  }
}
