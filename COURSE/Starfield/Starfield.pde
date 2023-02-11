ArrayList<Star> stars=new ArrayList();
void setup() {
  size(1080, 1080);
}
void draw() {

  background(0);

  stars.add(new Star(new PVector(width/2, height/2)));

  for (int i=0; i < stars.size(); i++) {

    stars.get(i).show();
    stars.get(i).move();
  }

  for (int i=0; i < stars.size(); i++) {

    if (dist(stars.get(i).font.x, stars.get(i).font.y, stars.get(i).p.x, stars.get(i).p.y)>550) {
      stars.remove(i);
      i--;
    }
  }
}
