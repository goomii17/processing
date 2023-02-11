class Star {

  PVector font, p, v, a;
  
  float size;

  Star(PVector font) {

    this.font=font;

    p=new PVector(font.x, font.y);

    v=new PVector(random(-1, 1), random(-1, 1));

    a=new PVector(random(-1, 1), random(-1, 1));
  }

  void show() {
    
    size=map(dist(font.x,font.y,p.x,p.y),0,550,0,25);
    
    fill(255);
    noStroke();

    ellipse(p.x, p.y, size, size);
  }

  void move() {

    v.add(a);

    p.add(v);

    if (p.x<0||p.y<0||p.x>1080||p.y>1080) {

      p=new PVector(font.x, font.y);

      v=new PVector(random(-1, 1), random(-1, 1));

      a=new PVector(random(-1, 1), random(-1, 1));
      
    }
  }
}
