ArrayList<Circle> circles=new ArrayList();
void setup() {
  size(720, 720);
}

void draw() {

  background(255);

  for (int i=0; i < circles.size(); i++) {
    circles.get(i).show();
  }
  
  ArrayList<PVector> pos=dimePos();
  circles.add(new Circle(pos));
  
}

ArrayList<PVector> dimePos() {
  ArrayList<PVector> pos=new ArrayList();
  for (int i=0; i < width; i++) {
    for (int j=0; j < height; j++) {
      float md=minDist(i, j);
      if (md>10) {
        pos.add(new PVector(i, j, md));
      }
    }
  }
  return pos;
}

float minDist(int x, int y) {

  float minD=Integer.MAX_VALUE;

  for (int i=0; i < circles.size(); i++) {
    minD=min(dist(x, y, circles.get(i).p.x, circles.get(i).p.y)-circles.get(i).size/2, minD);
  }

  return minD;
}
