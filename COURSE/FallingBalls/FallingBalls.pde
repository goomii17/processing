ArrayList<Ball> balls=new ArrayList();
void setup() {

  size(720, 720);

  balls.add(new Ball(random(width), random(height), random(5,50)));
}
void draw() {

  background(255);

  for (Ball b : balls) {
    b.show();
    b.move();
  }
}

void mousePressed(){
 
  if(mouseButton==RIGHT){
    if(balls.size()>0){
     balls.remove(0); 
    }
  }else{
   balls.add(new Ball(mouseX,mouseY, random(5,50)));
  }
  
}
