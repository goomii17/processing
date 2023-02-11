Ball b;
float g=0.1;
float w=1;

int count=-1;
float wait=random(250,1000);

void setup() {

  size(1080, 720);
  b=new Ball(width, height);
}

void draw() {

  background(0, 200, 255);

  PVector gravity=new PVector(0, g);
  PVector wind=new PVector(w, 0);
  PVector explosion=new PVector(-15, -15);

  if (frameCount%350==0) {

    g=random(0.1, 0.5);

    w=random(-1, 1);
    
  }
  
  if (frameCount%random(200, 1500)==0) {

    b.applyforce(explosion);
    
  }

  b.show();

  b.move();

  if (frameCount%750==0&&count==-1) {
    
    count=0;
    wait=random(250,1000);
    
  }
  
  if(count!=-1){
   
    count++;
    
    b.imant();

    fill(200,10,10);

    rect((width/2)-50, 0, 100, 50);
    
    textAlign(CENTER);
    
    PFont f=createFont("Arial",48);
    
    textFont(f);
    fill(255);
    text("N",(width/2),40);
    
    if(count==100)count=-1;
    
  }else{

    b.applyforce(gravity);
    b.applyforce(wind);
    
  }
}
