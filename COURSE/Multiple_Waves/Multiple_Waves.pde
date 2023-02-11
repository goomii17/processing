ArrayList<Wave> waves=new ArrayList();
int numWaves=3;
float v=0.1;
void setup() {
  size(720, 720);
  for (int i=0; i < numWaves; i++) {
    waves.add(new Wave(numWaves));
  }
}
void draw() {
  background(255);
  translate(0, height/2);
  for (int x=0; x < width; x+=3) {
    int y=0;
    for (int i=0; i < waves.size(); i++) {
      y+=waves.get(i).f(x);
    }
    strokeWeight(0);
    fill(5,255,255);
    ellipse(x,y,20,20);
  }
  for(int i=0; i < waves.size(); i++){
     waves.get(i).phase+=v;
  }
}

void mouseWheel(MouseEvent e){
  int n=e.getCount();
  v+=0.01*n;
}
