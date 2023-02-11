class Ball{
 PVector loc;
 PVector v;
 PVector a;
 float s;
 color c=color(random(255),random(255),random(255));
  Ball(float x, float y, float s){
   
    this.s=s;
    
    loc=new PVector(x,y);
    
    //v=new PVector(random(-1,1)<0?-random(1,3):random(1,3),random(-1,1)<0?-random(1,3):random(1,3));
    
    v=new PVector(random(-3,3),random(-3,3));
    
    a=new PVector(0,0.01);
    
    v.limit(5);
    
  }
  
  void show(){
   
    fill(c);
    ellipse(loc.x,loc.y,s,s);
    
  }
  
  void move(){
   
    if(loc.x+s<0){
     
      loc.x=width;
      
    }else if(loc.x-s>width){
     
      loc.x=0;
      
    }else if(loc.y+s<0){
     
      loc.y=height;
      
    }else if(loc.y-s>height){
     
      loc.y=0;
      
    }
    
    v.add(a);
    loc.add(v);
    
  }
  
}
