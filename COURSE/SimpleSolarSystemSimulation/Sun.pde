class Sun{
 
  PVector p;
  
  float mass;
  
  int size=100;
  
  Sun(){
   
    p=new PVector(360,360);
    
    mass=1000;
    
  }
  
  void show(){
   
    fill(240,240,0);
    
    ellipse(p.x,p.y,size,size);
    
  }
  
}
