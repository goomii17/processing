float n=100;
boolean ascending=true;
int speed=100;
boolean test=false;
float[] nums=new float[int(n)];
float[] original=new float[int(n)];
boolean sorted=false;
boolean paused;
int ml1;
float size;

void setup() {
  size(720, 720);
  size=720/n;
  for (int i=0; i < nums.length; i++) {
    float r=random(height-30)+20;
    nums[i]=r;
    original[i]=r;
  }
  ml1=millis();
  for (int i=original.length-1; i > 0; i--) {
    for (int j=0; j < i-1; j++) {
      swapO(j, j+1);//if dentro
    }
  }
  println("Tiempo real: "+(millis()-ml1)+ " milis");
  if (test)noLoop();
  frameRate(speed);
}
int i=0;
int last=int(n)-1;
void draw() {
  background(255);
  if (test) {
    printO();
  } else {
    if (paused) {
      printN(-1, -1);
    } else {
      if (sorted) {
        printN(-1, -1);
      } else {
        if (last!=0) {
          printN(i, i+1);
          swap(i, i+1);//if dentro
          if (i<last-1) {
          i++;
        } else {
          i=0;
          last--;
        }
        } else {
          printN(-1, -1);
          sorted=true;
          println("Tiempo real: "+(millis()-ml1)+ " milis");
          noLoop();
        }
      }
    }
  }
}

void mousePressed() {
  if (paused)paused=false;
  else paused=true;
}

void swap(int n1, int n2) {
  if (ascending) {
    if (nums[n2]<nums[n1]) {
      float aux=nums[n2];
      nums[n2]=nums[n1];
      nums[n1]=aux;
    }
  } else {
    if (nums[n1]<nums[n2]) {
      float aux=nums[n2];
      nums[n2]=nums[n1];
      nums[n1]=aux;
    }
  }
}

void swapO(int n1, int n2) {
  if (ascending) {
    if (original[n2]<original[n1]) {
      float aux=original[n2];
      original[n2]=original[n1];
      original[n1]=aux;
    }
  } else {
    if (original[n1]<original[n2]) {
      float aux=original[n2];
      original[n2]=original[n1];
      original[n1]=aux;
    }
  }
}

void printN(int n1, int n2) {
  noStroke();
  for (int i=0; i < nums.length; i++) {
    if (i==n1||i==n2) {
      fill(55, 55, 255);
    } else {
      fill(5, 255, 255);
    }
    rect(i*size, height, size, -nums[i]);
  }
}

void printO() {
  noStroke();
  for (int i=0; i < nums.length; i++) {
    fill(5,155,5);
    rect(i*size, height, size, -original[i]);
  }
}
