int resolution=20;
boolean show=false;
ArrayList<Vehicle> arrows=new ArrayList();
PVector[][] lines;
int w,h;
void setup() {
  size(1080, 720);
  lines=new PVector[width/resolution+1][height/resolution+1];
  for (int i=0; i < lines.length; i++) {
    for (int j=0; j < lines[0].length; j++) {
      float theta=random(-PI/3,PI/3);
      lines[i][j]=PVector.fromAngle(theta);
    }
  }
  for(int i=0; i < 100; i++){
     arrows.add(new Vehicle(random(width),random(height)));
  }
  
}

void draw() {
  background(200);
  for (Vehicle arrow : arrows) {
    arrow.show();
    arrow.move();
    arrow.bounder();
    arrow.steer(lines[int(arrow.p.x/resolution)][int(arrow.p.y/resolution)]);
  }
  if(show)printPath();
}

void mousePressed() {
  if(mouseButton==LEFT)arrows.add(new Vehicle(mouseX,mouseY));
  if(mouseButton==RIGHT)if(show)show=false; else show=true;
}

void printPath() {
  for (int i=0; i < lines.length; i++) {
    for (int j=0; j < lines[0].length; j++) {
      float angle=lines[i][j].heading();
      pushMatrix();
      translate(i*resolution+resolution/2,j*resolution+resolution/2);
      rotate(angle);
      line(-resolution/2,0,resolution/2,0);
      popMatrix();
    }
  }
}
