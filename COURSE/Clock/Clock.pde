Manecilla segs=new Manecilla(0);
Manecilla mins=new Manecilla(1);
Manecilla hrs=new Manecilla(2);

void setup(){
   size(720,720);
}

void draw(){
  
   background(255);
   
   translate(width/2,height/2);
   
   segs.show(millis());
   mins.show(millis());
   hrs.show(millis());
   
}
