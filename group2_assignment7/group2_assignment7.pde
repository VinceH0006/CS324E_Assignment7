Goalie g1;
int goalie = 0;
int player = 0; 

void setup(){
  size(750,750);
  background(255);
  g1 = new Goalie(120, 435, 130, 475, 20, 1.5);
  
}

void draw(){
  background(255);
  g1.display();
  g1.move();
  
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
  
  //GUI interface
  textSize(32);
  text("Goalie: " + goalie, width * (3/4), 30);
  text("Player: " + player, width * (3/4), 60);
  
  if(ball.x < 0 || ball.x > 750){
    ball.x = 250; //abritrary new x value for the ball to respawn
    ball.y = 300; //arbitrary new y value for the ball to respawn 
    goalie += 1;
  }
  if(ball.y > 275 && ball.y < 475 && ball.x > 0 && ball.x < 100){
    ball.x = 250; //abritrary new x value for the ball to respawn
    ball.y = 300; //arbitrary new y value for the ball to respawn 
    player += 1; 
  }
}
