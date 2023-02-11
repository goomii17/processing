class Star extends Particle {
  
  Star(PVector f) {
    super(f);
  }

  void show() {
    noStroke();    
    fill(0, map(dist(p.x, p.y, font.x, font.y), 0, 720, 255, 0), map(dist(p.x, p.y, font.x, font.y), 0, 720, 255, 0));
    pushMatrix();
    translate(p.x, p.y);
    rotate(radians(frameCount*rotVel));
    triangle(-15, 15, 15, 15, 0, -15);
    popMatrix();
  }
}
