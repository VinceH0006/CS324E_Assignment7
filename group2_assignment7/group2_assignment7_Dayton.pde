Player p1;
Ball b1;

void setup(){
  size(500, 500);
  p1 = new Player(50, 50, 10, //?) not sure on range that's ball size dependent;
}

void draw(){
  p1.display();
}

void keyPressed(){
  if (keyCode == RIGHT){
    p1.move(true, false, false, false);
  }
  else if (keyCode == LEFT){
    p1.move(false, true, false, false);
  }
  else if (keyCode == UP){
    p1.move(false, false, true, false);
  }
  else if (keyCode == DOWN){
    p1.move(false, false, false, true);
  }
}

void mousePressed(){
  if (mouseButton == LEFT){
    p1.hitBall(b1);
  }
  else if (mouseButton == RIGHT){
    p1.coverBall(b1);
  }
}
