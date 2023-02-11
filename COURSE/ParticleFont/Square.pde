class Square extends Particle {

  Square(PVector f) {
    super(f);
  }
  
  void show() {

    noStroke();
    pushMatrix();
    translate(p.x,p.y);
    rectMode(CENTER);
    rotate(radians(frameCount*rotVel));
    fill(0, map(dist(p.x, p.y, font.x, font.y), 0, 720, 255, 0), 0);
    rect(0, 0, 30, 30);
    popMatrix();
    
  }
}
