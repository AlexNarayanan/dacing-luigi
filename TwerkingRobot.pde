int WIDTH = 1280;
int HEIGHT = 720;
float mustacheAngle = 15;
float mustacheAngleChange = .5;
int neckLength = 10;
int neckLengthChange = 1;
int leftShoulderAngle = 30;
int rightShoulderAngle = 70;
int leftShoulderAngleChange = 4;
int rightShoulderAngleChange = 4;
int leftElbowAngle = 0;
int rightElbowAngle = 60;
int leftElbowAngleChange = 6;
int rightElbowAngleChange = 6;
int leftHipAngle = 0;
int rightHipAngle = 40;
int leftHipAngleChange = 4;
int rightHipAngleChange = 4;
int leftKneeAngle = 0;
int rightKneeAngle = 40;
int leftKneeAngleChange = 4;
int rightKneeAngleChange = 4;
int coinWidth = 100;
int coinWidthChange = -8;
int plantY = 320;
int plantDeltaY = 2;
float plantMouthAngle = 30;
float plantMouthAngleChange = .3;
int questionHue = 0;
int XPos = 200;


void setup() {
  size(WIDTH, HEIGHT);
  smooth();
  noStroke();
  frameRate(30);
}

void draw() {
  drawBackground();
  pushMatrix();
  moveLeftRight();
  translate(XPos, 270);
  drawLuigi();
  popMatrix();
  popMatrix();
}

void drawBackground() {
  drawSky();
  drawMountains();
  drawBoxes();
  drawClouds();
  drawPipe();
  drawGrass();
  drawDirt();
  rotateCoins();
  drawCoins();
  drawQuestionBlock();
}

void drawLuigi() {
  drawArms();
  drawHead();
  drawBody();
  drawLegs();
}

void drawHead() {
  //changeNeckLength();
  //pushMatrix();
  //translate(0, 10 - neckLength);
  fill(#E5C298);
  ellipse(0, 80, 70, 100); //Face Outline
  fill(#45b245);
  ellipse(0, 50, 80, 90); //Hat Outer
  fill(255);
  ellipse(0, 30, 35, 35); //White Circle
  fill(#45b245);
  pushMatrix();
  translate(-5, 32);
  rect(0, 0, 13, 4); // L
  rect(0, 0, 4, -13);
  popMatrix();
  fill(#007C21);
  ellipse(0, 53, 64, 25); //Hat Inner
  fill(#E5C298);
  ellipse(0, 75, 68, 48); //Face Over Hat
  pushMatrix();
  translate(0, 75);
  fill(255); //EYES
  ellipse(15, 0, 15, 25);
  ellipse(-15, 0, 15, 25);
  fill(#3ABDE8);
  ellipse(14, 0, 12, 18);
  ellipse(-14, 0, 12, 18);
  fill(0);
  ellipse(14, 0, 8, 14);
  ellipse(-14, 0, 8, 14); // End Eyes
  changeMustacheAngle();
  fill(0); //MUSTACHE
  pushMatrix();
  translate(15, 28);
  rotate(-radians(mustacheAngle));
  ellipse(0, 0, 50, 15);
  popMatrix();
  pushMatrix();
  translate(-15, 28);
  rotate(radians(mustacheAngle));
  ellipse(0, 0, 50, 15); //END MUSTACHE
  popMatrix();
  fill(#FFDCB1);
  ellipse(0, 18, 30, 33);
  fill(#633605);
  ellipse(-32, -3, 6, 25);
  ellipse(32, -3, 6, 25);
}

void drawMustache() {
  fill(0); //MUSTACHE
  pushMatrix();
  translate(15, 28);
  rotate(-radians(mustacheAngle));
  ellipse(0, 0, 50, 15);
  popMatrix();
  pushMatrix();
  translate(-15, 28);
  rotate(radians(mustacheAngle));
  ellipse(0, 0, 50, 15); //END MUSTACHE
  popMatrix();
}

void changeMustacheAngle() {
  mustacheAngle += mustacheAngleChange;
  if (mustacheAngle > 25 || mustacheAngle < 15) {
    mustacheAngleChange = -mustacheAngleChange;
    mustacheAngle += mustacheAngleChange;
  }
}

void changeNeckLength() {
  neckLength += neckLengthChange;
  if (neckLength > 20 || neckLength < 10) {
    neckLengthChange = -neckLengthChange;
    neckLength += neckLengthChange;
  }
}

void drawBody() {
  translate(0, 55);
  fill(#E5C298);
  rect(-10, -15, 20, 20); 
  fill(#45b245);
  rect(-14, 5, 28, 50); //Undershirt
  fill(#0815C9);
  rect(-24, 45, 48, 50, 0, 0, 15, 15);
  rect(-24, 5, 10, 50, 5, 0, 0, 0); //Suspenders
  rect(14, 5, 10, 50, 0, 5, 0, 0); 
  fill(#EBF533);
  ellipse (-18, 50, 8, 8); //Buttons
  ellipse(18, 50, 8, 8);
}

void drawLegs() {
  translate(0, 90);
  fill(#0815C9);
  pushMatrix();
  changeLeftHipAngle();
  rotate(radians(leftHipAngle));
  rect(-22, 0, 15, 50);
  translate(-22, 50);
  pushMatrix();
  changeLeftKneeAngle();
  rotate(radians(-leftKneeAngle));
  rect(0, 0, 15, 50);
  fill(#633605);
  ellipse(-4, 52, 36, 20);
  popMatrix();
  popMatrix();
  fill(#0815C9);
  pushMatrix();
  changeRightHipAngle();
  rotate(radians(-rightHipAngle));
  rect(7, 0, 15, 50);
  translate(22, 50);
  pushMatrix();
  changeRightKneeAngle();
  rotate(radians(rightKneeAngle));
  rect(0, 0, -15, 50);
  fill(#633605);
  ellipse(4, 52, 36, 20);
  popMatrix();
  popMatrix();
}

void changeLeftHipAngle() {
  leftHipAngle += leftHipAngleChange;
  if (leftHipAngle > 40 || leftHipAngle < 0) {
    leftHipAngleChange = -leftHipAngleChange;
    leftHipAngle += leftHipAngleChange;
  }
}

void changeRightHipAngle() {
  rightHipAngle += rightHipAngleChange;
  if (rightHipAngle > 40 || rightHipAngle < 0) {
    rightHipAngleChange = -rightHipAngleChange;
    rightHipAngle += rightHipAngleChange;
  }
}

void changeLeftKneeAngle() {
  leftKneeAngle += leftKneeAngleChange;
  if (leftKneeAngle > 40 || leftKneeAngle < 0) {
    leftKneeAngleChange = -leftKneeAngleChange;
    leftKneeAngle += leftKneeAngleChange;
  }
}

void changeRightKneeAngle() {
  rightKneeAngle += rightKneeAngleChange;
  if (rightKneeAngle > 40 || rightKneeAngle < 0) {
    rightKneeAngleChange = -rightKneeAngleChange;
    rightKneeAngle += rightKneeAngleChange;
  }
}

void drawArms() {
  fill(#45b245);
  drawLeftArm();
  drawRightArm();
}

void drawLeftArm() {
  pushMatrix();
  changeLeftShoulderAngle();
  translate(-22, 145);
  rotate(-radians(leftShoulderAngle));
  fill(#45b245);
  rect(-7, -35, 14, 50);
  translate(-7, -35);
  pushMatrix();
  changeLeftElbowAngle();
  rotate(radians(leftElbowAngle));
  rect(0, -50, 14, 50);
  fill(255);
  rect(-8, -75, 30, 25, 7, 7, 12, 12);
  rect(13, -93, 8, 23, 3, 3, 0, 0); //13
  popMatrix();
  popMatrix();
}

void drawRightArm() {
  pushMatrix();
  changeRightShoulderAngle();
  translate(22, 145);
  rotate(radians(rightShoulderAngle));
  fill(#45b245);
  rect(-7, -35, 14, 50);
  translate(7, -35);
  pushMatrix();
  changeRightElbowAngle();
  rotate(-radians(rightElbowAngle));
  rect(0, -50, -14, 50);
  fill(255);
  rect(-21, -75, 30, 25, 7, 7, 12, 12);
  rect(-20, -93, 8, 23, 3, 3, 0, 0); //-20
  popMatrix();
  popMatrix();
}

void changeRightShoulderAngle() {
  rightShoulderAngle += rightShoulderAngleChange;
  if (rightShoulderAngle > 70 || rightShoulderAngle < 30) {
    rightShoulderAngleChange = -rightShoulderAngleChange;
    rightShoulderAngle += rightShoulderAngleChange;
  }
}

void changeLeftShoulderAngle() {
  leftShoulderAngle += leftShoulderAngleChange;
  if (leftShoulderAngle > 70 || leftShoulderAngle < 30) {
    leftShoulderAngleChange = -leftShoulderAngleChange;
    leftShoulderAngle += leftShoulderAngleChange;
  }
}

void changeRightElbowAngle() {
  rightElbowAngle += rightElbowAngleChange;
  if (rightElbowAngle > 60 || rightElbowAngle < 0) {
    rightElbowAngleChange = -rightElbowAngleChange;
    rightElbowAngle += rightElbowAngleChange;
  }
}

void changeLeftElbowAngle() {
  leftElbowAngle += leftElbowAngleChange;
  if (leftElbowAngle > 60 || leftElbowAngle < 0) {
    leftElbowAngleChange = -leftElbowAngleChange;
    leftElbowAngle += leftElbowAngleChange;
  }
}

void drawSky() {
  fill(#499BC4);
  rect(0, 0, WIDTH, HEIGHT);
}

void drawGrass() {
  pushMatrix();
  translate(0, HEIGHT - 120);
  fill(#33D624);
  stroke(#205E10);
  strokeWeight(5);
  rect(-10, 0, WIDTH + 20, 20);
  noStroke();
}

void drawDirt() {
  translate(0, 15);
  fill(#C9AC75);
  rect(0, 0, WIDTH, 120);
  popMatrix();
}

void drawPipe() {
  drawPlant();
  int PIPEHEIGHT = 150;
  pushMatrix();
  strokeWeight(2);
  noFill();
  translate(800, HEIGHT - 120);
  setGradient(0, -PIPEHEIGHT, 100, PIPEHEIGHT, color(#4CE615), color(#308A0F), 2);
  stroke(0);
  rect (0, -PIPEHEIGHT, 100, PIPEHEIGHT);
  setGradient(-20, -PIPEHEIGHT - 50, 140, 50, color(#4CE615), color(#308A0F), 2);
  stroke(0);
  rect (-20, -PIPEHEIGHT - 50, 140, 50);
  noStroke();
  popMatrix();
}

void drawPlant() {

  changePlantHeight();
  animatePlant();
  pushMatrix();
  stroke(0);
  strokeWeight(2);
  translate(850, plantY);
  fill(#26A653);
  pushMatrix();
  translate(0, 80);
  rotate(radians(60));
  ellipse(0, -25, 20, 40);
  stroke(#0A4A20);
  line(0, 5, 0, -45);
  rotate(radians(-120));
  stroke(0);
  ellipse(0, -25, 20, 40);
  stroke(#0A4A20);
  line(0, 5, 0, -45);


  popMatrix();
  stroke(0);
  rect(-7, 30, 14, 80);
  fill(#D62B18);


  arc(0, 0, 90, 90, radians(270 + plantMouthAngle), radians(630 - plantMouthAngle), PI);
  noStroke();
  fill(255);
  pushMatrix();
  rotate(radians(plantMouthAngle));
  stroke(0);
  strokeWeight(1);
  triangle(-5, -18, -10, -22, -5, -26);
  triangle(-5, -33, -13, -37, -5, -41);
  noStroke();
  fill(0);
  ellipse(0, -46, 13, 13);
  fill(255);
  rect(-5, 0, 10, -45);
  stroke(0);
  line(-6, 0, -6, -45);
  noStroke();
  ellipse(0, -45, 10, 10);
  rotate(radians(-plantMouthAngle * 2));
  stroke(0);
  strokeWeight(1);
  triangle(5, -18, 10, -22, 5, -26);
  triangle(5, -33, 13, -37, 5, -41);
  noStroke();
  fill(0);
  ellipse(0, -46, 13, 13);
  fill(255);
  rect(-5, 0, 10, -45);
  stroke(0);
  line(6, -9, 6, -45);
  noStroke();
  ellipse(0, -45, 10, 10);
  popMatrix();
  ellipse(0, 0, 10, 10);
  ellipse(-28, -8, 16, 18); // DOTS
  ellipse(29, -12, 13, 14);
  ellipse(18, 16, 20, 22);
  ellipse(-11, 23, 22, 24);
  popMatrix();
}

void changePlantHeight() {
  plantY += plantDeltaY;
  if (plantY < 305 || plantY > 460) {
    plantDeltaY = -plantDeltaY;
    plantY += plantDeltaY;
  }
}

void animatePlant() {
  plantMouthAngle += plantMouthAngleChange;
  if (plantMouthAngle > 45 || plantMouthAngle < 25) {
    plantMouthAngleChange = -plantMouthAngleChange;
    plantMouthAngle += plantMouthAngleChange;
  }
}

void drawCoins() {
  fill(#F2EF13);
  stroke(#C7C40E);
  strokeWeight(7);
  ellipse(200, 150, coinWidth, 100);
  ellipse(350, 150, coinWidth, 100);
  ellipse(500, 150, coinWidth, 100);
  noStroke();
  fill(#C7C40E);
  rect(198, 115, coinWidth/10, 70, 3, 3, 3, 3);
  rect(348, 115, coinWidth/10, 70, 3, 3, 3, 3);
  rect(498, 115, coinWidth/10, 70, 3, 3, 3, 3);
}

void rotateCoins() {
  coinWidth += coinWidthChange;
  if (coinWidth > 100 || coinWidth < 0) {
    coinWidthChange = -coinWidthChange;
    coinWidth += coinWidthChange;
  }
}

void drawQuestionBlock() {
  pushMatrix();
  translate(1030, 80);
  fill(#F2EF13);
  rect(0, 0, 140, 140, 15, 15, 15, 15);
  fill(#C7C40E);
  ellipse(15, 15, 12, 12);
  ellipse(125, 125, 12, 12);
  ellipse(15, 125, 12, 12);
  ellipse(125, 15, 12, 12);
  colorMode(HSB);
  questionHue += 1;
  fill(color(questionHue % 255, 255, 255));
  textSize(100);
  text("?", 48, 105);
  popMatrix();
}

void drawMountains() {
  pushMatrix();
  translate(140, 600);
  drawMountain();
  translate(500, 0);
  drawMountain();
  translate(500, 0);
  drawMountain();
  popMatrix();
}

void drawMountain() {
  fill(#149140);
  ellipse(0, -60, 100, 120);
  triangle(-120, 0, -30, 0, -30, -109);
  triangle(120, 0, 30, 0, 30, -109);
  rect(-40, 0, 80, -20);
}

void drawClouds() {
  pushMatrix();
  translate(180, 80);
  drawCloud();
  translate(350, 140);
  drawCloud();
  translate(280, -90);
  drawCloud();
  translate(310, 120);
  drawCloud();
  popMatrix();
}

void drawCloud() {
  fill(255);
  ellipse(0, 0, 80, 80);
  ellipse(-50, 15, 50, 50);
  ellipse(50, 15, 50, 50);
  rect(-50, 20, 100, 20);
}

void drawBoxes() {
  pushMatrix();
  translate(240, 370);
  fill(#E6BE6A);
  rect(0, 0, 150, 230, 10, 10, 10, 10);
  fill(#E0E0E0);
  ellipse(15, 15, 15, 15);
  ellipse(135, 15, 15, 15);
  ellipse(15, 215, 15, 15);
  translate(110, 80);
  fill(#E66AB2);
  rect(0, 0, 150, 150, 10, 10, 10, 10); 
  fill(#E0E0E0);
  ellipse(15, 15, 15, 15);
  ellipse(135, 15, 15, 15);
  ellipse(15, 135, 15, 15);
  ellipse(135, 135, 15, 15);  
  popMatrix();
}

void moveLeftRight() {
  if (mouseX > XPos) {
    if (!(mouseX - XPos < 10 || XPos >= 1180)) {
      XPos += 6;
    }
  } else if (mouseX < XPos) {
    if (!(XPos - mouseX < 10 || XPos <= 100)) {
      XPos += -6;
    }
  }
}



void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {

  noFill();

  if (axis == 1) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }  
  else if (axis == 2) {  // Left to right gradient
    for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
  }
}


