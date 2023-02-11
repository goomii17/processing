static int w=1080;
static int h=540;

class Drop{
 
  float x=random(w);
  float y=random(-600);
  float speed=random(5,10);
  
  public void show(){
   
    fill(0,0,255);
    
    rect(x,y,3,30);
    
  }
  
  public void fall(){
    
    y=y+speed;
    
    if(y>h){
     
        x=random(w);
        y=random(0,-300);
        speed=random(5,10);
      
    }
    
  }
  
}

static Drop[] drops=new Drop[1000];

void setup(){
 
  size(1080,540);
  
  for(int i=0;i<drops.length;i++){
   
    drops[i]=new Drop();
    
  }
  
}

void draw(){
 
  background(50);
  
  for(int i=0;i<drops.length;i++){
   
    drops[i].show();
    
    drops[i].fall();
    
  }
  
  fill(150);
  ellipse(w/2,0,w-150,h/3);
  fill(150);
  ellipse(0,0,w/2,h/4);
  fill(150);
  ellipse(w,0,w/2,h/4);
  
}
