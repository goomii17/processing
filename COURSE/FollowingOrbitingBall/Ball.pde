class Ball {

  PVector loc;
  PVector m;
  PVector v;
  PVector a;
  PVector d;

  Ball() {

    loc=new PVector(width, height);
    m=new PVector(0, 0);
    v=new PVector(0,0);
    a=new PVector(0,0);
    
  }

  void show() {

    fill(255, 100, 255);

    ellipse(loc.x, loc.y, 20, 20);
  }

  void move() {
    
    
    m=new PVector(mouseX,mouseY);
    
    PVector aux=m;
    
    PVector d=aux.sub(loc);
    
    a=m.setMag(map(d.mag(),0,(sqrt(pow(720,2)*2)),0.5,0.25));
    
    v.add(a);

    loc.add(v);
    
  }
}
