float nc, nf, scl=30;
int w, h;
float inc=0.3;
float inc2=150;
float speed=0.2;

void setup() {

  size(720, 720, P3D);

  w=1600;
  h=1600;

  nf=w/scl;
  nc=h/scl;
}
float flying=0;

void draw() {

  background(0);

  pushMatrix();

  noFill();

  stroke(255);

  translate(width/2, height/2);

  rotateX(PI/3);

  translate(-w/2, -h/2);

  for (int y=0; y < nf; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x=0; x < nc; x++) {
      vertex(x*scl, y*scl,noise(x*inc,y*inc+flying)*inc2);
      vertex(x*scl, (y+1)*scl,noise(x*inc,y*inc+flying)*inc2);
    }
    endShape();
  }
  popMatrix();
  flying-=speed;
}
