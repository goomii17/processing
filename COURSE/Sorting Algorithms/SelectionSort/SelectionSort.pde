float n=100;
float speed=1;
boolean test=false;
boolean ascending=false;

float[] nums=new float[int(n)];
float[] original=new float[int(n)];

float size;

int last=int(n)-1;

boolean sorted=false;
boolean anim;
float animX1, animX2, animY1, animY2, animEnd1, animEnd2;
int ml1;
void setup() {
  size(1080, 720);
  size=width/n;
  for (int i=0; i < n; i++) {
    float r=random(height-30)+20;
    nums[i]=r;
    original[i]=r;
  }
  ml1=millis();
  for (int i=original.length-1; i > 0; i--) {
    int maxInd=0;
    for (int j=0; j < i; j++) {
      if (original[j]>original[maxInd])maxInd=j;
    }
    swapO(i, maxInd);
  }
  println("Tiempo real: "+(millis()-ml1)+" milis");
  if (test)noLoop();
}

void draw() {
  background(255);
  if (test) {
    printO();
  } else {
    if (!anim) {
      printNums(-1, -1);
      if (!sorted) {
        sortN();
      }
    } else {
      showAnim();
    }
  }
}

void sortN() {
  if (last<0) {
    println("Tiempo real: "+(millis()-ml1)+" milis");
    sorted=true;
    noLoop();
  } else {
    float max=nums[0];
    int maxIndx=0;
    for (int i=1; i < last+1; i++) {
      if (nums[i]>max) {
        max=nums[i];
        maxIndx=i;
      }
    }

    anim=true;
    animX1=maxIndx;
    animX2=last;
    animY1=max;
    animY2=nums[last];
    animEnd1=last;
    animEnd2=maxIndx;
    nums[maxIndx]=nums[last];
    nums[last]=max;
    last--;
  }
}

void showAnim() {
  if (animX1>animEnd1&&animX2<animEnd2) {
    printNums(-1, -1);
    anim=false;
  } else {
    anim=true;
    printNums(int(animEnd1), int(animEnd2));
    fill(5, 5, 255);
    rect(animX1*size, height, size, -animY1);

    fill(5, 5, 255);
    rect(animX2*size, height, size, -animY2);

    if (!(animX1>animEnd1)) animX1+=speed;

    if (!(animX2<animEnd2))animX2-=speed;
  }
}

void printNums(int n1, int n2) {
  noStroke();
  for (int i=0; i < nums.length; i++) {
    int plus=0;
    if (i>last)plus=200;
    if (i!=n1&&i!=n2) {
      fill(5+plus, 255, 255-plus);
      rect(i*size, height, size, -nums[i]);
    } else {
      if (i==n1) {
        fill(255, 100, 5, 100);
        rect(i*size, height, size, -nums[n2]);
      } else {
        fill(255, 100, 5, 100);
        rect(i*size, height, size, -nums[n1]);
      }
    }
  }
}
void printO() {
  noStroke();
  for (int i=0; i < original.length; i++) {
    fill(5, 255, 5);
    rect(i*size, height, size, -original[i]);
  }
}
void swapO(int n1, int n2) {
  float temp=original[n1];
  nums[n1]=nums[n2];
  nums[n2]=temp;
}
