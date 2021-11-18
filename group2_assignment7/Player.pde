class Player{
  int posX, posY;
  int playerSpeed;
  int range;
  float size = 10;
  boolean inRange = false;
  
  Player(int _posX, int _posY, int _playerSpeed, int _range){
    posX = _posX;
    posY = _posY;
    playerSpeed = _playerSpeed;
    range = _range;
  } 
  
  // feel free to delete these comments...just kept them for your reference
  void display(){
    line(posX - size, posY, posX + size, posY); // center line
    line(posX, posY - size, posX, posY + size); // vert center line
    fill(255, 255, 255);
    ellipse(posX, posY - size * 2, size * 2, size * 2); // head
    line(posX + size, posY, posX + size, posY + size); // right arm
    line(posX - size / 2, posY + size, posX + size / 2, posY + size); // hort leg line
    line(posX - size / 2, posY + size, posX - size / 2, posY + size * 1.5); // vert leg line
    line(posX + size / 2, posY + size, posX + size / 2, posY + size * 1.5); // vert leg line 2
    strokeWeight(1.5);
    line(posX - size, posY, posX + size + (size * 2.5 / 4), (posY + size * 1.5)); // stick
    rectMode(CENTER);
    fill(0, 0, 0);
    rect(posX + size + (size * 2.5 / 4), posY + size * 1.5, size * .8, size * .4); // stick head
  }
  
  void move(boolean right, boolean left, boolean up, boolean down){
    if (right){posX += playerSpeed;}
    else if (left){posX -= playerSpeed;}
    else if (up){posY -= playerSpeed;}
    else if (down){posY += playerSpeed;}
  }
  
  // leaving range for your specification so it makes since with your ball size
  boolean getRange(Ball ball){
    if (sqrt(sq(ball.y - posY) + sq(ball.x - posX)) <= range){
      return true;
    }
    else { 
      return false;
    }
  }
  
  void hitBall(Ball ball){
    inRange = getRange(ball);
      if (inRange){
        ball.Vx = -1 * ball.Vx;
      }
  }
  
  void coverBall(Ball ball){
    inRange = getRange(ball);
    if (inRange){
      ball.Vx = 0;
      ball.Vy = 0;
    }
  }
}
    
    
    
  
  
