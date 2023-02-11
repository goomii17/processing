class Line{
     
  PVector start;
  PVector end;
  boolean used=false;
  Line(PVector s,PVector e){
      start=s;
      end=e;
  }
  
  void display(){
     line(start.x,start.y,end.x,end.y); 
  }
  
  
  
}
