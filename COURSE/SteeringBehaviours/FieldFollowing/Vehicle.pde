class Vehicle {

  PVector p;
  PVector v;
  PVector a;
  PVector steering=new PVector();
  
  float maxSpeed=5;
  float maxForce=0.1;
  

  Vehicle(float x,float y) {
    //p=new PVector(random(1080), random(720));
    p=new PVector(x, y);
    v=new PVector(random(-3, 3), 0);
    a=new PVector(0,0);
  }

  void move() {
    v.add(a);
    p.add(v);
    a.mult(0);
  }

  void show() {
    float theta=v.heading2D()+radians(90);
    fill(100);
    pushMatrix();
    translate(p.x,p.y);
    rotate(theta);
    beginShape(TRIANGLES);
    vertex(0,0);
    vertex(-5,15);
    vertex(5,15);
    endShape();
    popMatrix();
  }
  
  void steer(PVector path){
    PVector desired=path.setMag(maxSpeed);
    steering=desired.copy().sub(v.copy());
    steering.limit(maxForce);
    a.add(steering);
  }
  
  void bounder(){
    if(p.x<0)p.x=1080;
    if(p.y<0)p.y=720; 
    if(p.x>1080)p.x=0;
    if(p.y>720)p.y=0;
  }
  
}
