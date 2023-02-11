ArrayList<Bubble> bubbles=new ArrayList();
void setup(){
  
    size(1080,720);
    
}
void draw(){
   
  background(255);
  
  for(int i=0; i < bubbles.size(); i++){
    
    bubbles.get(i).show();
    bubbles.get(i).move();
    bubbles.get(i).constrainY();
    bubbles.get(i).constrainX();
    
  }
  
  
}
void mousePressed(){
 if(mouseButton==LEFT){
  bubbles.add(new Bubble(width,height));
 }else if(bubbles.size()>0){
   bubbles.remove(0);
 }
}
