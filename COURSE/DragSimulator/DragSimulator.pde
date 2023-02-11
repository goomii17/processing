ArrayList<Ball> balls;
void setup() {
  size(1080, 720);
  balls=new ArrayList();
}
void draw() {

  background(255);
  fill(10, 105, 255);
  rect(0, height-400, width, 400);
  
  for (int i=0; i < balls.size(); i++) {

    PVector g=new PVector(0, balls.get(i).size*0.0049);
    PVector drag=balls.get(i).v.copy().mult(-0.01*balls.get(i).area(height-400));
    //PVector drag=balls.get(i).v.copy().normalize().mult(-0.001*pow(balls.get(i).v.copy().mag(), 2)).mult(balls.get(i).area(height-400));
    balls.get(i).show();
    balls.get(i).move();
    balls.get(i).applyForce(g);
    balls.get(i).applyForce(drag);
    
  }
}
void mousePressed() {

  balls.add(new Ball(width, height));
}
