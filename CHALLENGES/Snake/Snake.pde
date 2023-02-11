int w=15, h=15, ss, dir=1, appx=0, appy=0, score=0, score2=0;
boolean start=false;
ArrayList<Integer> x=new ArrayList();
ArrayList<Integer> y=new ArrayList();

int[] dx={0, 1, 0, -1};
int[] dy={-1, 0, 1, 0};
PFont f;
PImage shead0;
PImage shead1;
PImage shead2;
PImage shead3;

void setup() {

    size(792, 828);

    shead0=loadImage("SnakeHead.png");
    shead1=loadImage("SnakeHead1.png");
    shead2=loadImage("SnakeHead2.png");
    shead3=loadImage("SnakeHead3.png");

    x.add(w/2);
    y.add(h/2);

    f=createFont("Arial", 30);
    textFont(f);

    createApple();

    ss=720/w;
}

void draw() {

    translate(36, 36);

    if (start) {

        background(111, 60, 35);

        fill(0);

        rect(-36, height-(3*36), (width*36)+2*36, 36*2);

        fill(255);
        text("Score: " + score, 10, 770);

        for (int i=0; i<w; i++) {

            for (int j=0; j<w; j++) {

                fill(255);

                rect(i*ss, j*ss, ss, ss);
            }
        }

        fill(245, 10, 10);

        rect(appx*ss, appy*ss, ss, ss);

        for (int i=0; i<x.size(); i++) {

            if (i==x.size()-1) {

                //fill(10, 100, 10);
                if (dir==0) {

                    image(shead0, x.get(i)*ss, y.get(i)*ss, ss, ss);
                }
                if (dir==1) {

                    image(shead1, x.get(i)*ss, y.get(i)*ss, ss, ss);
                }
                if (dir==2) {

                    image(shead2, x.get(i)*ss, y.get(i)*ss, ss, ss);
                }
                if (dir==3) {

                    image(shead3, x.get(i)*ss, y.get(i)*ss, ss, ss);
                }
            } else {

                fill(25, 150, 40);

                rect(x.get(i)*ss, y.get(i)*ss, ss, ss);
            }
        }

        if (0>x.get(x.size()-1)||0>y.get(y.size()-1)||x.get(x.size()-1)>w-1||y.get(y.size()-1)>h-1) {

            noLoop();
        } else {

            for (int i=0; i<x.size()-1; i++) {

                if (x.get(i)==x.get(x.size()-1)&&y.get(i)==y.get(y.size()-1)) {

                    noLoop();
                }
            }
        }

        if (frameCount%10==0) {

            x.add(x.get(x.size()-1)+dx[dir]);
            y.add(y.get(y.size()-1)+dy[dir]);

            if (appx==x.get(x.size()-1)&&appy==y.get(y.size()-1)) {

                createApple();

                score++;
            } else {

                x.remove(0);
                y.remove(0);
            }
        }

        fill(255);
        text("X: " + x.get(x.size()-1)+" Y: " + y.get(y.size()-1), 550, 770);
    } else {

        background(111, 60, 35);

        fill(0);

        rect(-36, height-(3*36), (width*36)+2*36, 36*2);

        fill(255);
        text("Score: " + score, 10, 770);

        for (int i=0; i<w; i++) {

            for (int j=0; j<w; j++) {

                fill(255);

                rect(i*ss, j*ss, ss, ss);
            }
        }

        fill(245, 10, 10);

        rect(appx*ss, appy*ss, ss, ss);

        for (int i=0; i<x.size(); i++) {

            if (i==x.size()-1) {

                fill(10, 100, 10);
            } else {

                fill(25, 150, 40);
            }

            rect(x.get(i)*ss, y.get(i)*ss, ss, ss);
        }
        fill(255);
        text("X: " + x.get(x.size()-1)+" Y: " + y.get(y.size()-1), 550, 770);
    }
}

void keyPressed() {
    start=true;
    if (keyCode==UP) {

        if (dir!=2) {

            dir=0;
        } else {

            if (score==0) {

                dir=0;
            }
        }
    } else if (keyCode==RIGHT) {

        if (dir!=3) {

            dir=1;
        } else {

            if (score==0) {

                dir=1;
            }
        }
    } else if (keyCode==DOWN) {

        if (dir!=0) {

            dir=2;
        } else {

            if (score==0) {

                dir=2;
            }
        }
    } else if (keyCode==LEFT) {

        if (dir!=1) {

            dir=3;
        } else {

            if (score==0) {

                dir=3;
            }
        }
    }
}

void createApple() {

    while (true) {

        appx=(int)random(0, w);
        appy=(int)random(0, h);

        if (!(x.contains(appx)&&y.contains(appy))) {

            break;
        }
    }
}
