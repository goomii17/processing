class Line {

  // Two PVectors,
  // a is the "left" PVector and 
  // b is the "right PVector
  PVector a;
  PVector b;
  
  boolean d=false;
  
  Line(PVector start, PVector end) {
    a = start.get();
    b = end.get();
  }

  void display() {
    stroke(0);
    line(a.x, a.y, b.x, b.y);
  }

  PVector strt() {
    return a.get();
  }

  PVector end() {
    return b.get();
  }

  // This is easy, just 1/3 of the way
  PVector kochleft() {
    PVector v = PVector.sub(b, a);
    v.div(3);
    v.add(a);
    return v;
  }    

  // More complicated, have to use a little trig to figure out where this PVector is!
  PVector kochmiddle() {
    
    PVector v=PVector.sub(b,a).div(3);
    
    PVector p=a.copy();
    
    p.add(v);
    
    p.add(v.rotate(-radians(60)));
    
    return p;
  }    


  // Easy, just 2/3 of the way
  PVector kochright() {
    PVector v = PVector.sub(a, b);
    v.div(3);
    v.add(b);
    return v;
  }
}
