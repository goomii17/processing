class Particle {

  PVector p, v, a, font;
  
  float rotVel=random(-10,10);
  
  Particle(PVector font) {
    this.font=font;
    p=new PVector(font.x, font.y);

    v=new PVector(random(-5, 5), random(-10, 1));

    a=new PVector(0, 0.3);
  }

  void move() {

    v.add(a);

    p.add(v);
  }
  
  void show(){
    
  }
  
}
