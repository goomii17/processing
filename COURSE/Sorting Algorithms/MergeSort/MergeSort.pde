float n=250;
int speed=100;
boolean test=false;
float[] nums=new float[int(n)];
float[] original=new float[int(n)];
float size;
ArrayList<float[]> swaps=new ArrayList();
int ml1;
void setup() {
  size(1080, 720);
  size=width/n;
  for (int i=0; i < n; i++) {
    float r=random(height-20)+10;
    nums[i]=r;
    original[i]=r;
  }
  ml1=millis();
  mergeSort(0, int(n)-1);
  println("Tiempo real: "+(millis()-ml1)+" milis");
  if (test)noLoop();
  frameRate(speed);
}
int ind=0;
void draw() {
  background(255);
  if (test) {
    printA();
  } else {
    if (ind<swaps.size()) {
      printO();
      original[int(swaps.get(ind)[0])]=swaps.get(ind)[1];
      ind++;
    } else {
      printO();
      println("Tiempo animacion: "+(millis()-ml1)+" milis");
      noLoop();
    }
  }
}

void mergeSort(int start, int end) {
  if (start>=end)return;
  int mid=start+(end-start)/2;
  mergeSort(start, mid);
  mergeSort(mid+1, end);
  merge(start, mid, end);
}

void merge(int start, int mid, int end) {
  int n1=mid-start+1;
  int n2=end-mid;
  float[] nums1=new float[n1];
  float[] nums2=new float[n2];
  for (int i=0; i < n1; i++) {
    nums1[i]=nums[start+i];
  }
  for (int i=0; i < n2; i++) {
    nums2[i]=nums[mid+1+i];
  }
  int index1=0, index2=0, k=start;
  while (index1<n1&&index2<n2) {
    if (nums1[index1]<nums2[index2]) {
      nums[k]=nums1[index1];
      float[] s={k, nums1[index1]};
      swaps.add(s);
      index1++;
      k++;
    } else {
      nums[k]=nums2[index2];
      float[] s={k, nums2[index2]};
      swaps.add(s);
      index2++;
      k++;
    }
  }
  while (index1<n1) {
    nums[k]=nums1[index1];
    float[] s={k, nums1[index1]};
    swaps.add(s);
    index1++;
    k++;
  }
  while (index2<n2) {
    nums[k]=nums2[index2];
    float[] s={k, nums2[index2]};
    swaps.add(s);
    index2++;
    k++;
  }
}

void printO() {
  noStroke();
  for (int i=0; i < n; i++) {
    fill(5, 255, 5);
    rect(i*size, height, size, -original[i]);
  }
}

void printA(float[] n) {
  print(nums[0]);
  for (int i=1; i < n.length; i++) {
    print(" , "+n[i]);
  }
  println();
}

void printA() {
  noStroke();
  for (int i=0; i < n; i++) {
    fill(5, 255, 5);
    rect(i*size, height, size, -nums[i]);
  }
}
