/*
Pong Game
 s3601628
 Jason Alessio
 */

//background image
PImage img;

//ball position
float posX, posY;
float speedX, speedY;

//user inputs
float vert1, vert2;

//ellipse height and width
int e = 20;

//score integers
int score1 = 0;
int score2 = 0;

//rectangle height
int rectheight = 200;

//rectangle move speed
int rectspeed = 10;

//direction coinflip
float direction = 0;

//storing inputs
boolean w = false;
boolean s = false;
boolean up = false;
boolean down = false;


//-------------------------------------------------
void setup() {

  //setup box
  size(1000, 600);
  textSize(26);



  //helps with other dimensions
  rectMode(CENTER);

  //white background
  background(255);

  //image background
  img = loadImage("field.png");

  //setting initial position
  posX = width/2;
  posY = height/2;
  vert1 = height/2;
  vert2 = height/2;

  //setting random starting direction
  direction = random(1.0, 2.0);
  if (direction <= 1.0)
    speedX = random(-12.0, -6);
  if (direction > 1.0)
    speedX = random(6, 12.0);
  speedY = random(-8.0, 8.0);
}

void update() {
  //updating positions according to speed
  posX += speedX; //this is the same as saying posX = posX + speedX
  posY += speedY;

  //restarts game and updates score
  if (posX <= 0) {
    score2++;
    setup();
  }
  if (posX >= width) {
    score1++;
    setup();
  }

  //making it bounce off the top wall
  if (posY <= 0 || posY >= height) {
    speedY *= -1;
  }

  //making it bounce off the paddles
  if (posX > 79 && posX < 101 && posY <= vert1 + (rectheight/2) && posY >= vert1 - (rectheight/2)) {
    speedX *= -1;
  }
  if (posX < 921 && posX > 899 && posY <= vert2 + (rectheight/2) && posY >= vert2 - (rectheight/2)) {
    speedX *= -1;
  }

  //moving the paddles
  if (w == true)
    vert1 -= rectspeed;
  if (s == true)
    vert1 += rectspeed;
  if (up == true)
    vert2 -= rectspeed;
  if (down == true)
    vert2 += rectspeed;
}

void draw() {
  background(255);

  //image(img, 0, 0, width, height);

  update();

  //game components are black
  fill(0);
  ellipse(posX, posY, e, e);
  rect(100, vert1, 20, rectheight);
  rect(900, vert2, 20, rectheight);


  //score on the screen
  text("player 1 score: " + score1, 10, 580);
  text("player 2 score: " + score2, 780, 580);

  //instructions on the screen
  text("instructions", 10, 30);
  text("player 1: w and s to move", 10, 60);
  text("player 2: arrow keys to move", 10, 90);
}


/*
controls
 */
void keyPressed() {
  if (key == 'w') {
    w = true;
  }
  if (key == 's') {
    s = true;
  }
  if (keyCode == UP) {
    up = true;
  }
  if (keyCode == DOWN) {
    down = true;
  }
}

void keyReleased() {
  if (key == 'w') {
    w = false;
  }
  if (key == 's') {
    s = false;
  }
  if (keyCode == UP) {
    up = false;
  }
  if (keyCode == DOWN) {
    down = false;
  }
}
