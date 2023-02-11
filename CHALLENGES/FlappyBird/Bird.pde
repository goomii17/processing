class Bird{
 
  PVector p,v,g;
  
  float size=10;
  
  float ancho=600/size,alto=499/size;
  
  Bird(PVector inp){
   
    p=inp;
    
    v=new PVector(0,0);
    
    g=new PVector(0,1);
    
  }
  
  void show(){

    pushMatrix();
    translate(p.x,p.y);
    rotate(radians(-v.mag()));
    image(body,0,0,ancho,alto);
    popMatrix();
    
  }
  
  void move(){
   
   if(p.y>780-alto){
    
      noLoop();
      
    }
    
    v.add(g);
    v.mult(0.9);
    p.add(v);
    
  }
  
  void jump(){
   
    v.add(0,-30);
    
  }
  
}
