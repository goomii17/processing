class Vehicle {

  PVector p;
  PVector v;
  PVector a;
  PVector steering=new PVector();
  
  float maxSpeed=10;
  float maxForce=0.5;
  

  Vehicle() {
    p=new PVector(random(1080), random(720));
    v=new PVector(random(-3, 3), random(-3, 3));
    a=new PVector(0,0);
  }

  void move() {
    v.add(a);
    float d=dist(mouseX,mouseY,p.x,p.y);
    if(d<150){
      float m=map(d,0,150,0,maxSpeed);
      v.setMag(m);
    }
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
  
  void steer(){
    PVector target=new PVector(mouseX,mouseY);
    PVector desired=target.sub(p.copy()).setMag(maxSpeed);
    steering=desired.copy().sub(v.copy());
    steering.limit(maxForce);
    a.add(steering);
  }
  
}
