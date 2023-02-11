class Planet{
 
  PVector p,v,a;
  
  float size;
  
  color c=color(random(255),random(255),random(255));
  
    Planet(float x,int y){
   
    p=new PVector(x,y);
    
    if(mouseX<360){
     
      v=new PVector(2,0);
      
    }else{
     
      v=new PVector(-2,0);
      
    }
    
    a=new PVector(0,0);
    
    size=random(20,30);
    
  }
  
  Planet(){
   
    p=new PVector(360,mouseY);
    
    if(mouseX<360){
     
      v=new PVector(2,0);
      
    }else{
     
      v=new PVector(-2,0);
      
    }
    
    a=new PVector(0,0);
    
    size=random(10,30);
    
  }
  
  void show(){
   
    fill(c);
    
    ellipse(p.x,p.y,size,size);
    
  }
  
  void move(){
   
    v.add(a);
    
    p.add(v);
    
    a.mult(0);
    
  }
  
  void attract(Sun s){
   
    PVector d=p.copy().sub(s.p.copy());
    
    float dist=d.mag();
    float G=-1;
    
    PVector fg=d.normalize().mult(G*s.mass/(pow(dist,2)));
    
    a.add(fg);
    
  }
  
  boolean check(Sun s){
   
    if(p.copy().sub(s.p.copy()).mag()<s.size/2+size/2){
     
      return false;
      
    }
    
    return true;
    
  }
  
}
