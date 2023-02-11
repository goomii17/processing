class Manecilla {

  ArrayList<Float> points=new ArrayList();

  float r;

  color c;

  int type;

  Manecilla(int t) {

    type=t;

    if (t==0) {

      r=300;

      c=color(78, 255, 10);
    } else if (t==1) {

      r=275;

      c=color(218,3,255);
    } else {

      r=250;

      c=color(255,10,255);
    }
  }

  void show(float m) {

    float milis=m%60000;
    float segs=m%3600000;
    float mins=m%216000000;
    
    float ang;

    if (type==0) {
      ang=map(milis, 0, 60000, 0, 360);
    } else if (type==1) {
      ang=map(segs, 0, 3600000, 0, 360);
    } else {
      ang=map(mins, 0, 216000000, 0, 360);
    }

    points.add(ang);

    for (int i=0; i < points.size(); i++) {

      noStroke();

      fill(c);

      ellipse(r*cos(radians(points.get(i)-90)), r*sin(radians(points.get(i)-90)), 16, 16);

      strokeWeight(20);
    }


    stroke(c);

    line(0, 0, r*cos(radians(ang-90))/(2+type), r*sin(radians(ang-90))/(2+type));

    if (type==0) {
      if (milis>59940) {

        points=new ArrayList();
      }
    } else if (type==1) {
      if (segs>3590000) {

        points=new ArrayList();
      }
    } else {
      if (mins>215990000) {

        points=new ArrayList();
      }
    }
  }
}
