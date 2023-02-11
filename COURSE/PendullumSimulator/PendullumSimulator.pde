ArrayList<Bob> bobs=new ArrayList();
float speed=0.5;
void setup(){
   
  size(1080,720);
  for(int i=0; i < 9; i++){
  
  bobs.add(new Bob(width,i,9));
  
  }
}

void draw(){
  
  background(255);
  
  for(int i=0; i < bobs.size(); i++){
     
  bobs.get(i).show();
  bobs.get(i).move();

  PVector g=new PVector(0,98/bobs.get(i).r*speed);
  
  PVector t=bobs.get(i).origin.copy().sub(bobs.get(i).p.copy()).setMag(g.mag());
  
  bobs.get(i).applyForce(g);
  bobs.get(i).applyForce(t);
    
  }
  
  
}

void mousePressed(){
 
  if(mouseButton==LEFT){
   
    //bobs.add(new Bob(width));
    bobs.add(new Bob());
  }else {
   
    bobs.remove(0);
    
  }
  
}
