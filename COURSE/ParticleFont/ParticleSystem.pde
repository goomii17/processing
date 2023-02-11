class ParticleSystem {

  ArrayList<Particle> p=new ArrayList();

  void addParticle() {
    if (mouseButton==LEFT) {
      p.add(new Circle(new PVector(mouseX, mouseY)));
    } else if (mouseButton==RIGHT) {
      p.add(new Square(new PVector(mouseX, mouseY)));
    } else {
      p.add(new Star(new PVector(mouseX, mouseY)));
    }
  }

  void show() {
    for (int i=0; i < p.size(); i++) {

      p.get(i).show();
      p.get(i).move();

      if (p.get(i).p.y>730) {
        p.remove(i);
      }
    }
  }
}
