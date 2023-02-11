ArrayList<Line> lines=new ArrayList();

float a=0;

void setup() {
  size(1000, 800);
  lines.add(new Line(new PVector(width/2, height), new PVector(width/2, height/1.5)));
}

void draw() {
  background(5, 255, 5);
  //a=map(mouseY, 0, height, 0, 180);
  a+=0.5;
  for (int i=0; i < 12; i++) {
    generate();
  }
  for (Line l : lines) {
    l.display();
  }
  lines=new ArrayList();
  lines.add(new Line(new PVector(width/2, height), new PVector(width/2, height/1.5)));
}

void generate() {
  ArrayList<Line> newlines=new ArrayList();
  for (Line l : lines) {
    if (!l.used) {
      PVector p=PVector.sub(l.end, l.start);
      PVector v=p.copy();
      v.div(1.5);
      p.add(l.start);
      newlines.add(new Line(l.end, p.copy().add(v.rotate(radians(a)))));
      newlines.add(new Line(l.end, p.copy().add(v.rotate(radians(-2*a)))));
      l.used=true;
    }
    newlines.add(l);
  }
  lines=newlines;
}
