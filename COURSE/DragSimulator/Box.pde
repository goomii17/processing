class Ball {

  float size,w,h;

  PVector p, v, a;

  color c=color(random(255), random(255), random(50));

  Ball(int w, int h) {
    
    this.w=w;
    this.h=h;
    
    size=map(mouseX,0,w,5,50);

    p=new PVector(mouseX,mouseY);

    v=new PVector(0, 0);

    a=new PVector(0, 0);
    
  }

  void show() {

    fill(c);

    ellipse(p.x, p.y, size, size);
  }

  void move() {

    if (p.y+size/2<h) {

      v.add(a);

      p.add(v);

      a.mult(0);
      
    }else{
     
      p.y=h-size/2;
      
    }
  }

  void applyForce(PVector f) {

    a.add(f);
    
  }
  
  float area(int line){
   
    if(p.y+size/2>line){
     
      if(abs(p.y+size/2-line)<size){
       return size*abs(p.y+size/2-line)*0.01; 
      }else{
       return size*size*0.01; 
      }
      
    }
    
    return 0;
    
  }
  
}
