ParticleSystem ps=new ParticleSystem();
void setup() {

  size(1080, 720);
  
  
  frameRate(100);
  
}
void draw() {

  background(255);
  ps.show();
  if (mousePressed) {
    ps.addParticle();
  }
  
}
