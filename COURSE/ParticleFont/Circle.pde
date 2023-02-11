class Circle extends Particle {

  Circle(PVector f) {
    super(f);
  }

  void show() {
    noStroke();    
    fill(map(dist(p.x, p.y, font.x, font.y), 0, 720, 255, 20), 25, 255);
    ellipse(p.x, p.y, 30, 30);
  }
}
