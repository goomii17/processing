class Bubble {

  PVector p, v, a;
  int w,h;
  float size;
  color c=color(random(0,100),random(0,255),255);

  Bubble(int w, int h) {
    
    this.w=w;
    this.h=h;
    size=random(10, 50);
    
    v=new PVector(random(-2,2),random(-5,-2));
    //p=new PVector(random(w), h-size);
    p=new PVector(mouseX, mouseY);
  }

  void move(){
    
    boolean change=false;
    
    if(random(0,100)<5){
      
      change=true;
      
    }
    
    if(change){
     
      v.x*=-1;
      
    }
    
    p.add(v);
    
  }
  
  void show(){
    
    fill(c);
    
    ellipse(p.x,p.y,size,size);
    
  }
  void constrainY(){
   
    if(p.y+(size/2)<0){
     
      p.y=h-size/2;
      
    }
    
  }
  
  void constrainX(){
   
    if(p.x+(size/2)<0){
     
      p.x=w-size/2;
      
    }
    
    if(p.x-(size/2)>w){
     
      p.x=-size/2;
      
    }
    
  }
  
}
