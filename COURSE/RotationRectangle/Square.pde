class Square{
 
  float x=560,y=360;
  
  float ang=0,w=0,a=0;
  
  void show(){
   
    fill(0);
    
    rectMode(CENTER);
    
    translate(560,360);
    
    rotate(ang);
    
    rect(0,0,80,40);
    
  }
  
  void spin(){
   
    a=map(mouseX,0,1080,-0.001,0.001);
    
    w+=a;
    
    ang+=w;
    
  }
  
}
