class Ball {
  
  float x, y;
  float size;
  float vx, vy;
  
  Ball(float x, float y, float size, float vx, float vy) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.vx = vx;
    this.vy = vy;
    if (vy > 4) {vy = vy - 3;}
    if (vy < -4) {vy = vy + 3;}
  }
  
  void display() {
    ellipse(x, y, size, size);
  }
  
  void move() {
    x += vx;
    y += vy;
    
    if ((x < size/2) || (x > width-(size/2))) {
      vx = -vx;
    }
    if ((y < size/2) || (y > height-(size/2))) {
      vy = -vy;
    }
  }
}
