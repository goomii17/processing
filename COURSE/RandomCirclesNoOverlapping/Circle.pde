class Circle{
   PVector p;
   float size;
   float ms=75;
  Circle(ArrayList<PVector> pos){
    int ind=int(random(pos.size()));
    float maxSize=pos.get(ind).z;
      p=new PVector(pos.get(ind).x,pos.get(ind).y);
      if(maxSize>ms)maxSize=ms;
      size=maxSize-5;
  }
  void show(){
     fill(255,5,255);
     ellipse(p.x,p.y,size,size);
  }
}
