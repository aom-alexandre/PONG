PImage ball;
PImage left;
PImage right;

int x = 650;
int y = 350;
int horizontal = 5;
int vertical = 0;
int ul = 5;
int dl = -5;

int p1;
int p1s = 0;
int p2;
int p2s = 0;

PImage owin;
PImage twin;

void setup(){
  size(1300, 700);
  
  ball = loadImage("ball.png");
    
  left = loadImage("rect.png");
  right = loadImage("rect.png");
  
  owin = loadImage("1win.png");
  twin = loadImage("2win.png");
  
  p1 = height/2 - left.height/2;
  p2 = height/2 - right.height/2;
  
  print("P1 uses 'W' to go up and 'S' to go down, P2 uses the arrows, 'R' resarts the game and you can increase/decrease speed with 'T'/'Y', increase.");
}

void drawBase(){
  background(0, 0, 0);
  
  fill(255, 255, 255);
  rect(width/2 - 1, 10, 2, 20);
  rect(width/2 - 1, 40, 2, 20);
  rect(width/2 - 1, 70, 2, 20);
  rect(width/2 - 1, 100, 2, 20);
  rect(width/2 - 1, 130, 2, 20);
  rect(width/2 - 1, 160, 2, 20);
  rect(width/2 - 1, 190, 2, 20);
  rect(width/2 - 1, 220, 2, 20);
  rect(width/2 - 1, 250, 2, 20); 
  rect(width/2 - 1, 280, 2, 20);
  rect(width/2 - 1, 310, 2, 20);
  rect(width/2 - 1, 340, 2, 20);
  rect(width/2 - 1, 370, 2, 20);
  rect(width/2 - 1, 400, 2, 20);
  rect(width/2 - 1, 430, 2, 20);
  rect(width/2 - 1, 460, 2, 20);
  rect(width/2 - 1, 490, 2, 20);
  rect(width/2 - 1, 520, 2, 20);
  rect(width/2 - 1, 550, 2, 20);
  rect(width/2 - 1, 580, 2, 20);
  rect(width/2 - 1, 610, 2, 20);
  rect(width/2 - 1, 640, 2, 20);
  rect(width/2 - 1, 670, 2, 20);
  }

void drawBall(){
  image(ball, x - ball.width/2, y - ball.height/2);
  x = x + horizontal;
  y = y + vertical;
  
  if ((y <= 0) || (y + ball.height >= height)){
  vertical = -vertical;  
  }
}

void drawPlayers(){
  image(left, 0, p1);
  image(right, width - right.width, p2);

  if ((y + ball.height/2 >= p1) && (y <= p1 + left.height) && (x <= left.width)){
  horizontal = -horizontal;
  vertical = (int) random(dl, ul);
  }
  
  if ((y <= p2 + right.height) && (y + ball.height/2 >= p2) && (x + ball.width >= width)){
  horizontal = -horizontal;
  vertical = (int) random(-5, 5);
  }
}

void points(){
  if (p1In()){
  p1s = p1s + 1;
  
  p1 = height/2 - left.height/2;
  p2 = height/2 - right.height/2;
  
  x = 650;
  y = 350;
  }
  
  if (p2In()){
  p2s = p2s + 1;
  
  p1 = height/2 - left.height/2;
  p2 = height/2 - right.height/2;
  
  x = 650;
  y = 350;
  }
  
  if (p1s == 10){
  fill(255, 255, 255);
  textSize(50);
  text(p1s, 575, 50);
  p1 = height/2 - left.height/2;
  p2 = height/2 - right.height/2;
  image(owin, width/2 - owin.width/2, height/2 - owin.height/2);
  noLoop();
  }
  
  if (p2s == 10){
  p1 = height/2 - left.height/2;
  p2 = height/2 - right.height/2;
  image(twin, width/2 - twin.width/2, height/2 - twin.height/2);
  noLoop();
  }
  
  if (p1s == 10){
  fill(0, 0, 0);
  textSize(1);
  }
  text(p1s, 600, 50);
  textSize(50);
  fill(255, 255, 255);
  text(p2s, 670, 50);
}

boolean p1In(){
  if (x >= width)
    return true;
  else
    return false;
}

boolean p2In(){
  if(x + ball.width <= 0)
    return true;
  else
    return false;
}

void draw(){
  
  drawBase();
  
  drawBall();
  
  drawPlayers();
  
  points();
}

void keyPressed(){
  if (key == 'w'){
  p1 = p1 - 5;
  }
  else if (key == 's'){
  p1 = p1 + 5;
  }
  if (key == 'a'){
  p1 = p1 - 5000;
  }
  else if (key == 'd'){
  p2 = p2 + 5000;
  }
  
  if (key == CODED){
    if (keyCode == UP){
    p2 = p2 - 5;
    }
    if (keyCode == DOWN){
    p2 = p2 + 5;
    }
    if (keyCode == LEFT){
    p1 = p1 + 5000;
    }
    if (keyCode == RIGHT){
    p2 = p2 - 5000;
    }
  }
  
  if (key == 'r'){
  loop();
  
  p1 = height/2 - left.height/2;
  p2 = height/2 - right.height/2;
  
  x = 650;
  y = 350;
  horizontal = 5;
  vertical = 0;
  
  p1s = 0;
  p2s = 0;
  }
  if (key == 't'){
    if (horizontal >= 0){
    horizontal = horizontal + 1;
    }
    else
    horizontal = horizontal - 1;
  }
  if (key == 'y'){
    if (horizontal >= 0){
    horizontal = horizontal - 1;
    }
    else
    horizontal = horizontal + 1;
  }
  if (key == 'g'){
  ul = ul + 1;
  dl = dl - 1;
  }
  else if (key == 'h'){
  ul = ul - 1;
  dl = dl + 1;
  }
}