float speedx=0.1;
float speedy=0.1;
float rangex=1;
float rangey=1;

void setup() {
  size(800, 800);
}

void draw() {
  background(15,5,255);
  drawCircle(width/2, height/2, 300);
  if(rangex<-8||rangex>8)speedx*=-1;
  int s=int(speedx/(abs(speedx)));
  speedx=map(mouseX, 0, width, 0.05, 0.2)*s;
  if(rangey<-8||rangey>8)speedy*=-1;
  int sy=int(speedy/(abs(speedy)));
  speedy=map(mouseY, 0, height, 0.05, 0.2)*sy;
  rangex+=speedx;
  rangey+=speedy;
}

void drawCircle(float x, float y, float d) {
  if (d<10)return;
  noStroke();
  fill(map(d,10,300,0,255));
  ellipse(x, y, d, d);
  drawCircle(x+d/rangex, y, d/2);
  drawCircle(x-d/rangex, y, d/2);
  drawCircle(x, y+d/rangey, d/2);
  drawCircle(x, y-d/rangey, d/2);
}

void mousePressed(){
   speedx=0.1;
   speedy=0.1;
}
