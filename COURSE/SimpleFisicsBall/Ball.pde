class Ball {

  PVector p;
  PVector v;
  PVector a;

  int w, h, r=25;

  Ball(int w, int h) {

    this.w=w;
    this.h=h;

    p=new PVector(w/2, h/6);
    v=new PVector(0, 0);
    a=new PVector(0, 0);
    
  }

  void applyforce(PVector f) {

    a.add(f);
    
  }

  void show() {

    fill(200, 100, 0);

    ellipse(p.x, p.y, 50, 50);
  }

  void move() {
    
    PVector comp=v.copy().add(p.copy());
    
    if(comp.x-r<0){
     
      p.x=r;
      
    }
    if(comp.x+r>w){
    
      p.x=w-r;
      
    }
    if(comp.y-r<0){
     
      p.y=r;
      
    }
    if(comp.y+r>h){
     
      p.y=h-r;
      
    }

    if (p.x-r==0||p.x+r==w) {

      v.x=v.x*-1;
      
    }

    if (p.y-r==0||p.y+r==h) {

      v.y=v.y*-1;
      
    }
    
    v.add(a);
    
    p.add(v);
    
    a.mult(0);
    
  }
  
  void imant(){
    
   PVector ceil=new PVector(w/2,0);
   PVector d=p.copy().sub(ceil);
   a=d.copy();
   a.setMag(-360/d.mag());
   
  }
  
}
