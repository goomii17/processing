class Drop {

  PVector p;
  PVector v;
  PVector a;

  float x;
  float y;

  Drop() {

    p=new PVector(random(-500, 1200), random(-1000,10));

    v=new PVector(0, random(1, 3));

    a=new PVector(0, random(0.2, 0.3));

    x=random(5, 10);
    y=random(10, 30);
    
  }

  void show() {

    if(p.y<720){
    
    fill(216, 0, 166);

    rect(p.x, p.y, x, y);
      
    }
    
  }

  void move() {
    
    v.add(a);

    p.add(v);
    
  }
  
  void applyFroce(PVector force){
  
    a.add(force);
    
  }
  
}
