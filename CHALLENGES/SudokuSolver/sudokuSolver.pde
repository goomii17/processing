int delay_ms=250;
boolean blank=false;

static int[][] s;
static int[][] original;
String[] lineas=new String[9];
static boolean solved=false, start=false, error=false, block=false;
PFont f, f2;
int size=12, sizev=1, lumx=-1, lumy=-1;

void setup() {

    size(720, 720);

    lineas[0]="058064000";
    lineas[1]="609000040";
    lineas[2]="002370068";
    lineas[3]="087000050";
    lineas[4]="003800700";   //MEDIO 48
    lineas[5]="500407002";
    lineas[6]="870046000";
    lineas[7]="000253800";
    lineas[8]="020080004";

    if (blank) {
        s=new int[9][9];
        for (int i=0; i<9; i++) {
            for (int j=0; j<9; j++) {
                s[i][j]=0;
            }
        }
        original=new int[9][9];
        for (int i=0; i<9; i++) {
            for (int j=0; j<9; j++) {
                original[i][j]=s[i][j];
            }
        }
    } else {
        block=true;
        s=convert(lineas);
        original=new int[9][9];
        for (int i=0; i<9; i++) {
            for (int j=0; j<9; j++) {
                original[i][j]=s[i][j];
            }
        }
    }
    f=createFont("Arial", 48);
    f2=createFont("Comic Sans MS Negrita", 72);
}

void draw() {

    //Dibujar tablero
    for (int i=0; i<9; i++) {
        for (int j=0; j<9; j++) {
            stroke(0);
            strokeWeight(3);
            fill(255);
            rect(i*(width/9), j*(height/9), width/9, height/9);
        }
    }
    for (int i =1; i<3; i++) {
        stroke(0);
        strokeWeight(5);
        line(0, 3*i*height/9, width, 3*i*height/9);
    }

    for (int i =1; i<3; i++) {
        stroke(0);
        strokeWeight(5);
        line(3*i*width/9, 0, 3*i*width/9, height);
    }

    stroke(0);
    strokeWeight(10);
    line(0, 0, width, 0);

    stroke(0);
    strokeWeight(10);
    line(0, 0, 0, height);

    stroke(0);
    strokeWeight(10);
    line(0, height, width, height);

    stroke(0);
    strokeWeight(10);
    line(width, 0, width, height);

    //Dibujar numeros
    for (int i=0; i<9; i++) {
        for (int j=0; j<9; j++) {
            if (s[i][j]!=0) {
                if (original[i][j]!=0){
                    fill(5,100,200);
                }else{
                    fill(0);
                }
                textFont(f);
                textAlign(CENTER);
                text(Integer.toString(s[i][j]), j*(height/9), i*(width/9)+10, (height/9), (width/9));
            }
        }
    }

    //Iluminar casilla
    if (lumx!=-1) {
        strokeWeight(10);
        stroke(255, 255, 5);
        noFill();
        rect(lumx, lumy, width/9, height/9);
    }

    //Mensaje inicio
    if (!start) {
        fill(100, size, 200);
        textFont(f2);
        textSize(size);
        textAlign(CENTER);
        text("Press any key \nto start", 0, height/3, width, height);
        expandMessage();
    }

    //Mensaje error
    if (error) {
        fill(255, 0, 0);
        textFont(f2);
        textSize(48);
        textAlign(CENTER);
        text("ERROR", 0, height/3, width, height);
    }
}

void keyPressed() {
    start=true;
    if (start&&keyCode==ENTER&&!solved) {
        if (check()) {
            original=new int[9][9];
            for (int i=0; i<9; i++) {
                for (int j=0; j<9; j++) {
                    original[i][j]=s[i][j];
                }
            }
            thread("solve");
            block=true;
        } else {
            error=true;
        }
    }
    if (keyCode==ENTER&&solved) {
        restart();
    }
    if (key==BACKSPACE) {
        if (lumx!=-1&&lumy!=-1) {
            s[lumy/(height/9)][lumx/(width/9)]=0;
            if (check()) {
                error=false;
            }
        }
    }
    if (key=='1'||key=='2'||key=='3'||key=='4'||key=='5'||key=='6'||key=='7'||key=='8'||key=='9') {
        if (lumx!=-1&&lumy!=-1) {
            s[lumy/(height/9)][lumx/(width/9)]=parseInt(Character.toString(key));
        }
    }
    if (keyCode==RIGHT) {
        if (lumx!=-1&&lumy!=-1&&lumx/(width/9)<8) {
            lumx+=(width/9);
        }
    }
    if (keyCode==LEFT) {
        if (lumx!=-1&&lumy!=-1&&lumx/(width/9)>0) {
            lumx-=(width/9);
        }
    }
    if (keyCode==UP) {
        if (lumx!=-1&&lumy!=-1&&lumy/(width/9)>0) {
            lumy-=(height/9);
        }else{
            delay_ms-=10;
            if (delay_ms<0){
                delay_ms=0;
            }
        }
    }
    if (keyCode==DOWN) {
        if (lumx!=-1&&lumy!=-1&&lumy/(width/9)<8) {
            lumy+=(height/9);
        }else{
            delay_ms+=10;
            if (delay_ms>5000){
                delay_ms=5000;
            }
        }
    }
}

void mousePressed() {
    start=true;
    int x=mouseX;
    int y=mouseY;
    for (int i=0; i<width; i++) {
        if (x%(width/9)!=0) {
            x--;
        }
        if (y%(height/9)!=0) {
            y--;
        }
        if (x%(width/9)==0&&y%(width/9)==0) {
            break;
        }
    }
    if (x!=lumx||y!=lumy) {
        lumx=x;
        lumy=y;
    } else {
        lumx=-1;
        lumy=-1;
    }
    if (block) {
        lumx=-1;
        lumy=-1;
    }
}

void solve() {
    lumx=-1;
    lumy=-1;
    if (completed()&&!solved) {
        prints();
        solved=true;
    } else if (!solved) {
        ArrayList<String> pos=dimePos();
        for (int i=0; i<pos.size(); i++) {
            int f=Integer.parseInt(Character.toString(pos.get(i).charAt(0)));
            int c=Integer.parseInt(Character.toString(pos.get(i).charAt(1)));
            int k=Integer.parseInt(Character.toString(pos.get(i).charAt(2)));
            s[f][c]=k;
            delay(delay_ms);
            solve();
            if (solved==false) {
                s[f][c]=0;
                delay(delay_ms);
            } else {
                break;
            }
        }
    }
}

boolean check() {
    for (int i=0; i<9; i++) {
        for (int j=0; j<9; j++) {
            if (s[i][j]!=0) {
                if (!sePuede(i, j, s[i][j])) {
                    return false;
                }
            }
        }
    }
    return true;
}

public static ArrayList<String> dimePos() {
    ArrayList<String> pos=new ArrayList();
    int f=-1;
    int c=-1;
    boolean b=false;
    for (int i = 0; i < s.length; i++) {
        for (int j = 0; j < s.length; j++) {
            if (s[i][j]==0) {
                f=i;
                c=j;
                b=true;
                break;
            }
        }
        if (b)break;
    }
    if (f!=-1&&c!=-1) {
        for (int k=1; k<10; k++) {
            if (sePuede(f, c, k)) {
                pos.add(f+""+c+""+k);
            }
        }
    }
    return pos;
}

void expandMessage() {
    if (size>86||size<12) {
        sizev*=-1;
        size+=sizev;
    } else {
        size+=sizev;
    }
}

public static boolean completed() {
    for (int i=0; i<9; i++) {
        for (int j=0; j<9; j++) {
            if (s[i][j]==0) {
                return false;
            }
        }
    }
    return true;
}

public static int[][] convert(String[] l) {
    int[][] s=new int[9][9];
    for (int i=0; i<9; i++) {
        for (int j=0; j<9; j++) {
            s[i][j]=Integer.parseInt(Character.toString(l[i].charAt(j)));
        }
    }
    return s;
}

void restart() {
    if (blank) {
        s=new int[9][9];
        for (int i=0; i<9; i++) {

            for (int j=0; j<9; j++) {

                s[i][j]=0;
            }
        }
    } else {
        s=convert(lineas);
    }
    solved=false;
    start=false;
    if (blank) {
        block=false;
    } else {
        block=true;
    }
}

public static void prints() {
    for (int i=0; i<9; i++) {
        for (int j=0; j<9; j++) {

            System.out.print(s[i][j]);
        }
        System.out.println();
    }
    System.out.println();
}

public static boolean sePuede(int f, int c, int n) {
    //COmprobar fila
    for (int i=0; i<9; i++) {
        if (i!=c) {
            if (s[f][i]==n) {
                return false;
            }
        }
    }
    //Comprobar columna
    for (int i=0; i<9; i++) {
        if (i!=f) {
            if (s[i][c]==n) {
                return false;
            }
        }
    }

    //Comprobar bloque

    int bc;
    int bf;

    if (c<3) {
        bc=0;
    } else if (c<6) {
        bc=3;
    } else {
        bc=6;
    }
    if (f<3) {
        bf=0;
    } else if (f<6) {
        bf=3;
    } else {
        bf=6;
    }
    for (int i=bf; i<bf+3; i++) {
        for (int j=bc; j<bc+3; j++) {
            if (!(i==f&&j==c)) {
                if (s[i][j]==n) {
                    return false;
                }
            }
        }
    }
    return true;
}
