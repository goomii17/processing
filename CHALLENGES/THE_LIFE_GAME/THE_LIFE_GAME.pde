int tam=45;
int delay=5;
float size;
boolean paused=true;
int[][] world=new int[tam][tam];
void setup() {
  size(720, 720);
  size=width/tam;
  for (int i=0; i < tam; i++) {
    for (int j=0; j < tam; j++) {
      world[i][j]=0;
    }
  }
}
void draw() {
  background(50);
  stroke(255);
  strokeWeight(0.5);
  for (int i=0; i < tam; i++) {
    for (int j=0; j < tam; j++) {
      if (world[i][j]==0) {
        noFill();
      } else {
        fill(255);
      }
      rect(size*i, size*j, size, size);
    }
  }
  if (paused) {
    stroke(0, 222, 5);
    strokeWeight(2);
    line(width-(size/3)*2, size/4, width-(size/3)*2, size-size/4);
    line(width-(size/3), size/4, width-(size/3), size-size/4);
  } else {
    noStroke();
    fill(0, 222, 5);
    triangle(width-(size/3)*2, size/4, width-(size/3)*2, size-size/4, width-(size/3), size-size/2);
  }
  if (!paused)if (frameCount%delay==0)updateWorld();
}

void mousePressed() {
  if (mouseButton==LEFT) {
    world[int(mouseX/size)][int(mouseY/size)]=1;
  } else if (mouseButton==RIGHT) {
    world[int(mouseX/size)][int(mouseY/size)]=0;
  } else {
    if (paused)paused=false;
    else paused=true;
  }
}
void mouseDragged() {
  if (mouseX<width&&mouseX>0&&mouseY<height&&mouseY>0) {
    if (mouseButton==LEFT) {
      world[int(mouseX/size)][int(mouseY/size)]=1;
    } else {
      world[int(mouseX/size)][int(mouseY/size)]=0;
    }
  }
}
void keyPressed() {
  if (mouseX<width&&mouseX>0&&mouseY<height&&mouseY>0) {
    if (key==ENTER) {
      if (paused)paused=false;
      else paused=true;
    } else if (key=='r')reset();
  }
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  delay+=e;
  if (delay<1)delay=1;
  if (delay>25)delay=25;
}

void updateWorld() {
  int[][] copy=new int[tam][tam];
  for (int i=0; i < tam; i++) {
    for (int j=0; j < tam; j++) {
      copy[i][j]=0;
    }
  }

  for (int i=0; i < tam; i++) {
    for (int j=0; j < tam; j++) {
      if (dimeState(i, j)==0) {
        copy[i][j]=0;
      } else {
        copy[i][j]=1;
      }
    }
  }
  for (int i=0; i < tam; i++) {
    for (int j=0; j < tam; j++) {
      world[i][j]=copy[i][j];
    }
  }
}

int dimeState(int i, int j) {
  int cellState=world[i][j];
  int lifeCount=0;
  //up
  if (j-1>=0) {
    if (world[i][j-1]==1)lifeCount++;
  }
  //down
  if (j+1<tam) {
    if (world[i][j+1]==1)lifeCount++;
  }
  //right
  if (i+1<tam) {
    if (world[i+1][j]==1)lifeCount++;
  }
  //left
  if (i-1>=0) {
    if (world[i-1][j]==1)lifeCount++;
  }
  //left up
  if (i-1>=0&&j-1>=0) {
    if (world[i-1][j-1]==1)lifeCount++;
  }
  //left down
  if (i-1>=0&&j+1<tam) {
    if (world[i-1][j+1]==1)lifeCount++;
  }
  //right up
  if (i+1<tam&&j-1>=0) {
    if (world[i+1][j-1]==1)lifeCount++;
  }
  //right down
  if (i+1<tam&&j+1<tam) {
    if (world[i+1][j+1]==1)lifeCount++;
  }
  if (cellState==0&&lifeCount==3)return 1;
  if (cellState==1&&(lifeCount<2||lifeCount>3))return 0;
  return cellState;
}

void reset() {
  paused=true;
  for (int i=0; i < tam; i++) {
    for (int j=0; j < tam; j++) {
      world[i][j]=0;
    }
  }
}
