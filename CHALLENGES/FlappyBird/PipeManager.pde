class PipeManager {

  ArrayList<Pipe> p=new ArrayList();

  int index=0;
  
  Bird b;
  
  PipeManager(Bird b) {
    
    this.b=b;
    
    for (int i=0; i < 20; i++) {

      p.add(new Pipe(i, map(noise(i), 0, 1, 0, 720), 75));
      index++;
    
  }
  }

  void run() {

    if (p.size()<20) {

      p.add(new Pipe(index, map(noise(index), 0, 1, 0, 720), 75));
      index++;
      
    }

    for (int i=0; i < p.size(); i++) {

      p.get(i).show();
      p.get(i).move();
      
      if(!p.get(i).check(b)){
       
        noLoop();
        
      }
      
    }

    for (int i=0; i < p.size(); i++) {

      if (p.get(i).p.x+50<0) {

        p.remove(i);
        index--;
        
      }
    }
  }
}
