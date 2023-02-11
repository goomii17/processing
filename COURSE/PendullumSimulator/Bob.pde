class Bob {

  float r;
  float ang, aVel;
  PVector p;
  PVector origin;
  PVector a;

  Bob(float w,int i,int n) {

    a=new PVector(0, 0);

    r=350;

    //ang=random(-90, 90);
    ang=90-((i)*10);
    aVel=0;

    origin=new PVector(w/2, 0);

    p=new PVector(origin.x+r*sin(radians(ang)), origin.y+r*cos(radians(ang)));
  
}

  Bob() {
    
    a=new PVector(0, 0);

    r=sqrt(pow((540-mouseX),2)+pow(mouseY,2));
    
    ang=degrees(acos((mouseY/r)));
    if(mouseX-540<=0)ang*=-1;
    aVel=0;

    origin=new PVector(1080/2, 0);

    p=new PVector(origin.x+r*sin(radians(ang)), origin.y+r*cos(radians(ang)));
    
  }

  void show() {

    line(origin.x, origin.y, p.x, p.y);
    fill(123);
    ellipse(p.x, p.y, 30, 30);
    
  }

  void move() {
    if (a.x<0) {
      aVel-=a.mag();
    } else {
      aVel+=a.mag();
    }
    ang+=aVel;

    p.x=origin.x+r*sin(radians(ang));
    p.y=origin.y+r*cos(radians(ang));

    a.mult(0);
    
  }

  void applyForce(PVector force) {

    a.add(force);
    
  }
}
