class Pipe{
 
  PVector p,v;
  
  float spacey, sep;
  
  Pipe(float i, float spacey, float sep){
    
    this.spacey=spacey;
    this.sep=sep;
    
    float separacion=(i*500)-i;
    
    constrain(separacion,0,500);
    
    p=new PVector(1080+separacion,0);
    v=new PVector(-7,0);
    
  }
  
  void show(){
   
    fill(0,200,0);
    
    rect(p.x,0,50,spacey-sep);
    
    fill(0,200,0);
    
    rect(p.x,spacey+sep,50,720-spacey);
    
  }
  
  void move(){
   
    p.add(v);
    
  }
  
  boolean check(Bird b){
   
    if(dist(b.p.x,b.p.y,p.x,p.y)<50){
     println(dist(b.p.x,b.p.y,p.x,p.y));
      return false;
      
    }
    return true;
  }
  
}
