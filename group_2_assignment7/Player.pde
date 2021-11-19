class Player {
  float x, y;
  float playerSpeed;
  float size, range;
  
  boolean inRange = false;
  
  Player(int x, int y, int playerSpeed, int size) {
    this.x = x;
    this.y = y;
    this.playerSpeed = playerSpeed;
    this.size = size;
  }
  
  void display() {
    line(x - size, y, x + size, y); // center line
    line(x, y - size, x, y + size); // vert center line
    fill(255, 255, 255);
    ellipse(x, y - size * 2, size * 2, size * 2); // head
    line(x + size, y, x + size, y + size); // right arm
    line(x - size / 2, y + size, x + size / 2, y + size); // hort leg line
    line(x - size / 2, y + size, x - size / 2, y + size * 1.5); // vert leg line
    line(x + size / 2, y + size, x + size / 2, y + size * 1.5); // vert leg line 2
    strokeWeight(1.5);
    line(x - size, y, x + size + (size * 2.5 / 4), (y + size * 1.5)); // stick
    rectMode(CENTER);
    fill(0, 0, 0);
    rect(x + size + (size * 2.5 / 4), y + size * 1.5, size * .8, size * .4); // stick head
  }
  
  void move(boolean up, boolean down) {
    if (up) {y -= playerSpeed;}
    else if (down) {y += playerSpeed;}
  }
  
}
