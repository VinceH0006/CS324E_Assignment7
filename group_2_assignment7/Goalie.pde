class Goalie{
  float x, y, x2, y2, size;
  float speed;
  boolean gIsMovingUp;
  
  Goalie(float x, float y, float x2, float y2, float size, float speed){
    this.x = x;
    this.y = y;
    this.x2 = x2;
    this.y2 = y2;
    this.size = size;
    this.speed = speed;
  }
  void display(){
    rectMode(CORNERS);
    fill(0);
    rect(x, y, x2, y2);
    rect(x2, (y+y2)/2, x2 + 10, ((y+y2)/2) +10);
    circle((x+x2)/2, y, size);
  }
  
  void move(){
    if(y2 > 475){
      gIsMovingUp = true;
    }
    if(y < 275){
      gIsMovingUp = false;
    }
    if(gIsMovingUp){
      y -= speed;
      y2 -= speed;
    }else{
      y += speed;
      y2 += speed;
    }
  }
  
}
