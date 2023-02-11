ArrayList<Drop> d=new ArrayList();
void setup() {

  size(1080, 720);
  
}
void draw() {

  background(255);
  
  d.add(new Drop());
  
  for (int i=0; i < d.size(); i++) {

    d.get(i).show();
    d.get(i).move();
    
  }

  if (mousePressed) {
    if (mouseButton==LEFT) {
      PVector wind=new PVector(0.01, 0);
      for (int i=0; i < d.size(); i++) {

        d.get(i).applyFroce(wind);
        
      }
    }
  }
  
  for (int i=0; i < d.size(); i++) {

    if(d.get(i).p.y>720){
     
      d.remove(i);
      
    }
    
  }
  
}
