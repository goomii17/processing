ArrayList<Vehicle> arrows=new ArrayList();
void setup() {
  size(1080, 720);
}

void draw() {
  background(255);
  for (Vehicle arrow : arrows) {
    arrow.show();
    arrow.move();
    arrow.steer();
  }
}

void mousePressed(){
 
  arrows.add(new Vehicle());
  
}
