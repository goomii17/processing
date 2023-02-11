ArrayList<Planet> planets=new ArrayList();
Sun s=new Sun();
void setup(){
   
  size(720,720);
  
  for(int i=1; i <= 3; i++){
     
    planets.add(new Planet(width/2,i*69));
    
  }
  
  
}
void draw(){
   
  background(0);
  s.show();
  for(int i=0; i < planets.size(); i++){
     
    planets.get(i).show();
    planets.get(i).move();
    planets.get(i).attract(s);
    
    if(!planets.get(i).check(s)){
     
      planets.remove(i);
      
    }
    
  }
  
}

void mouseDragged(){
  
  planets.add(new Planet());
  
}
