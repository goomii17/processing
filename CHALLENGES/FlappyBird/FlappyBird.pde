PImage body;
Bird b;
PipeManager pm;
void setup(){
   
  size(1080,720);
  
  body=loadImage("Body.png");
  
  b=new Bird(new PVector(64,height/2));
  
  pm=new PipeManager(b);
  
}

void draw(){
   
  background(255);
  
  b.show();
  b.move();
  
  pm.run();
  
}

void keyPressed(){
 
  b.jump();
  
}

void mousePressed(){
 
  b.jump();
  
}
