ArrayList<Line> lines=new ArrayList();
ArrayList<PVector> verts=new ArrayList();
void setup() {
  size(800, 500);
  lines.add(new Line(new PVector(width/3,0),new PVector(width/2,-(sqrt(3)/2)*(width/3))));
  Line l=new Line(new PVector(width/3,0),new PVector(width*2/3,0));
  l.d=true;
  lines.add(l);
  lines.add(new Line(new PVector(width/2,-(sqrt(3)/2)*width/3),new PVector(width*2/3,0)));
}

void draw() {
  background(255);
  translate(0,height/1.5);
  for(Line l : lines){
    l.display();
  }
  for(PVector p : verts){
     ellipse(p.x,p.y,2,2); 
  }
}

void mousePressed(){
  createLines();
}

void createLines(){
  ArrayList<Line> newlines=new ArrayList();
  for(Line l : lines){
    
    PVector a=l.strt();
    PVector b=l.kochleft();
    PVector c=l.kochmiddle();
    PVector d=l.kochright();
    PVector e=l.end();
    if(l.d)c.y*=-1;
    newlines.add(new Line(a,b));
    newlines.add(new Line(b,c));
    newlines.add(new Line(c,d));
    newlines.add(new Line(d,e));
  }
  lines=newlines;
}
