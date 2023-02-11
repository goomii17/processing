float n=100;
int speed=10;
boolean test=false;
float[] nums=new float[int(n)];
float[] original=new float[int(n)];
float size;
boolean sorted;
int ml1;
void setup() {
  size(1080, 720);
  size=width/n;
  for (int i=0; i < nums.length; i++) {
    float r=random(height-30)+20;
    nums[i]=r;
    original[i]=r;
  }
  ml1=millis();
  for (int i=1; i < nums.length; i++) {
    if (nums[i]<nums[i-1])insert(i, getPos(i));
  }
  println("Tiempo real: "+(millis()-ml1)+ " milis");
  if (test)noLoop();
  frameRate(speed);
}
int index=1;
void draw() {
  background(255);
  if (test) {
    printN();
  } else {
    if (index<original.length) {
      int p=getPosO(index);
      printO(index, p);
      if (original[index]<original[index-1])
        insertO(index, p);
      index++;
    } else {
      printN();
      println("Tiempo de animacion: "+(millis()-ml1)+ " milis");
      noLoop();
    }
  }
}

void insert(int inInd, int endInd) {
  float value=nums[inInd];
  for (int i=inInd; i > endInd; i--) {
    nums[i]=nums[i-1];
  }
  nums[endInd]=value;
}

void insertO(int inInd, int endInd) {
  float value=original[inInd];
  for (int i=inInd; i > endInd; i--) {
    original[i]=original[i-1];
  }
  original[endInd]=value;
}

int getPos(int ind) {
  float value=nums[ind];
  for (int i=0; i < ind; i++) {
    if (nums[i]>=value)return i;
  }
  return 0;
}

int getPosO(int ind) {
  float value=original[ind];
  for (int i=0; i < ind; i++) {
    if (original[i]>=value)return i;
  }
  return 0;
}

void printN() {
  for (int i=0; i < nums.length; i++) {
    noStroke();
    fill(5, 255, 5);
    rect(size*i, height, size, -nums[i]);
  }
}

void printO(int n1, int n2) {
  for (int i=0; i < original.length; i++) {
    if (i==n1||i==n2)fill(255, 5, 55); 
    else fill(5, 255, 5);
    noStroke();
    rect(size*i, height, size, -original[i]);
  }
}
