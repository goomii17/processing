float x, y, t=0;
float parameter=0.01, speed=3;
ArrayList<int[]> path=new ArrayList();

void setup() {

  size(720, 720);
  x=0;
  y=height/2;
  
}

void draw() {

  background(255);
  for (int i=0; i<path.size(); i++) {
    noStroke();
    fill(map(i*y,0,height*path.size(),255,0),map(i*y,0,height*path.size(),0,255),map(i*y,0,height*path.size(),255,0));
    ellipse(path.get(i)[0], path.get(i)[1],5,5);
  }
  move();
}

void move() {
  
  int[] coord={(int)x,(int)y};
  if(!path.contains(coord)){
   path.add(coord); 
  }
  
  x+=speed;
  y=map(noise(t),0,1,0,height);
  
  constrain(x,0,width);
  constrain(y,0,height);
  t+=parameter;
  
}
