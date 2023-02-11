float n=500;
int speed=20;
boolean test=false;
float[] nums=new float[int(n)];
float[] original=new float[int(n)];
float size;
int ml1;
ArrayList<int[]> swaps=new ArrayList();
boolean sorted=false;
void setup() {
  size(1080, 720);
  size=width/n;
  for (int i=0; i < nums.length; i++) {
    float r=random(height-30)+20;
    nums[i]=r;
    original[i]=r;
  }
  ml1=millis();
  quickSort(0, nums.length-1);
  println("Tiempo real: "+(millis()-ml1)+ " milis");
  if (test)noLoop();
  frameRate(speed);
}
int ind=0;
void draw() {
  if (test) {
    printN();
  } else {
    if (!sorted) {
      printO(swaps.get(ind)[0], swaps.get(ind)[1]);
      swapO(swaps.get(ind)[0], swaps.get(ind)[1]);
      ind++;
    } else {
      printN();
      println("Tiempo de animacion: "+(millis()-ml1)+ " milis");
      noLoop();
    }
    if (ind==swaps.size()) {
      sorted=true;
    }
  }
}

void quickSort(int start, int end) {
  if (start>=end)return;
  int ind=partition(start, end);
  quickSort(start, ind-1);
  quickSort(ind+1, end);
}

int partition(int start, int end) {
  float pivotValue=nums[end];
  int pivotInd=start;
  for (int i=start; i < end; i++) {
    if (nums[i]<pivotValue) {
      swap(i, pivotInd);
      pivotInd++;
    }
  }
  swap(end, pivotInd);
  return pivotInd;
}
void swap(int n1, int n2) {
  int[] n={n1, n2}; 
  swaps.add(n);
  float temp=nums[n1];
  nums[n1]=nums[n2];
  nums[n2]=temp;
}

void swapO(int n1, int n2) {
  float temp=original[n1];
  original[n1]=original[n2];
  original[n2]=temp;
}

void printN() {
  background(255);
  for (int i=0; i < nums.length; i++) {
    noStroke();
    fill(5, 255, 5);
    rect(size*i, height, size, -nums[i]);
  }
}

void printO(int n1, int n2) {
  background(255);
  for (int i=0; i < nums.length; i++) {
    noStroke();
    if (i==n1||i==n2)fill(255, 5, 55);
    else fill(5, 255, 5);
    rect(size*i, height, size, -original[i]);
  }
}
