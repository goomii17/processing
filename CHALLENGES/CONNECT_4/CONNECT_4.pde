float animSpeed=20;
boolean empiezoYo=true;
boolean hacks=true;
boolean inteligentAi=true;

int f=6, c=7;
float size;
int[][] board=new int[7][6];
boolean humanTurn;
boolean finished=false;

color animCol;
float animX;
float animY;
float animEnd;
boolean anim;
int animPlr;

void setup() {
  size(770, 770);
  size=width/7;
  for (int i=0; i < c; i++) {
    for (int j=0; j < f; j++) {
      board[i][j]=0;
    }
  }
  humanTurn=empiezoYo;
}
//Bucle principal
void draw() {
  background(255);
  printBoard();
  if (anim) {
    if (animY<animEnd) {
      fill(animCol);
      ellipse(animX, animY, size*0.7, size*0.7);
      animY+=animSpeed;
    } else {
      anim=false;
      board[int(animX/size)][int((animEnd-size)/size)]=animPlr;
      int w=dimeWinner();
      if (w==-1) {
        println("Empate!!");
      } else {
        if (w!=0) {
          println("Ganan los "+ w+" !!");
          finished=true;
        }
      }
    }
  }
  if (!humanTurn&&!anim&&!finished) {
    if (inteligentAi) {
      aiPick();
      //aiPick2();
    } else {
      aiRandPick();
    }
  }
}

//Imprimir tablero
void printBoard() {
  fill(200);
  strokeWeight(3);
  stroke(0);
  for (int i=0; i < c; i++) {
    for (int j=0; j < f; j++) {
      rect(i*size, j*size+size, size, size);
    }
  }
  strokeWeight(1);
  for (int i=0; i < c; i++) {
    for (int j=0; j < f; j++) {
      if (board[i][j]==1) {
        fill(255, 5, 255);
        ellipseMode(CENTER);
        ellipse(i*size+size/2, j*size+size+size/2, size*0.7, size*0.7);
      } else if (board[i][j]==2) {
        fill(5, 255, 255);
        ellipseMode(CENTER);
        ellipse(i*size+size/2, j*size+size+size/2, size*0.7, size*0.7);
      }
    }
  }
}
//Meter ficha humano
void mousePressed() {
  if (mouseButton==LEFT&&humanTurn&&!finished&&!anim&&columnaLibre(int(mouseX/size))) {
    setAnim(int(mouseX/size), 1);
    humanTurn=false;
  }
  if (hacks&&mouseButton==RIGHT&&humanTurn&&!finished&&!anim&&huecoVacio(int(mouseX/size), int((mouseY-size)/size))) {
    board[int(mouseX/size)][int((mouseY-size)/size)]=1;
    humanTurn=false;
    int w=dimeWinner();
    if (w!=0) {
      finished=true;
      if (w==-1) {
        println("Empate!!");
      } else {
        println("Ganan los "+ w+" !!");
      }
    }
  }
  if (mouseButton==CENTER&&hacks) {
    quitaFicha(int(mouseX/size));
  }
}
//Meter ficha ai
void aiRandPick() {
  ArrayList<Integer> emptyCols=dimeEmpty();
  if (emptyCols.size()>0) {
    int r=int(random(emptyCols.size()));
    setAnim(emptyCols.get(r), 2);
    humanTurn=true;
  }
}
ArrayList<Integer> dimeEmpty() {
  ArrayList<Integer> e=new ArrayList();
  for (int i=0; i < c; i++) {
    boolean t=false;
    for (int j=0; j < f; j++) {
      if (board[i][j]==0) {
        t=true;
        break;
      }
    }
    if (t)e.add(i);
  }
  return e;
}
void meteFicha(int col) {
  boolean metida=false;
  for (int i=f-1; i >=0; i--) {
    if (board[col][i]==0) {
      if (humanTurn) {
        metida=true;
        board[col][i]=1;
        break;
      } else {
        metida=true;
        board[col][i]=2;
        break;
      }
    }
  }
  if (metida) {
    if (humanTurn) {
      humanTurn=false;
    } else {
      humanTurn=true;
    }
  }
}
void quitaFicha(int c) {
  if (hayFicha(c)) {
    for (int i=0; i < f; i++) {
      if (board[c][i]!=0) {
        board[c][i]=0;
        break;
      }
    }
  }
  if (humanTurn) {
    humanTurn=false;
  } else {
    humanTurn=true;
  }
}
//Comprobar estado de juego (-1->empate,0->nada,1->gana humano,2->gana ai)
int dimeWinner() {
  //horizontal
  for (int i=0; i < f; i++) {
    for (int j=0; j < c-3; j++) {
      String s="";
      for (int k=j; k < 4+j; k++) {
        s+=Integer.toString(board[k][i]);
      }
      int n=revisaSubstring(s);
      if (n!=0)return n;
    }
  }
  //vertical
  for (int i=0; i < c; i++) {
    for (int j=0; j < f-3; j++) {
      String s="";
      for (int k=j; k < 4+j; k++) {
        s+=Integer.toString(board[i][k]);
      }
      int n=revisaSubstring(s);
      if (n!=0)return n;
    }
  }
  //diagonales izquierda abajo
  for (int i=0; i < 3; i++) {
    for (int j=0; j < 3-i; j++) {
      String s="";
      for (int k=0; k < 4; k++) {
        s+=board[k+j][i+j+k];
      }
      int n=revisaSubstring(s);
      if (n!=0)return n;
    }
  }
  //diagonales derecha abajo
  for (int i=0; i < 3; i++) {
    for (int j=0; j < 3-i; j++) {
      String s="";
      for (int k=0; k < 4; k++) {
        s+=board[6-(k+j)][i+j+k];
      }
      int n=revisaSubstring(s);
      if (n!=0)return n;
    }
  }
  //diagonales derecha izquierda
  for (int i=0; i < 3; i++) {
    for (int j=0; j < 3-i; j++) {
      String s="";
      for (int k=0; k < 4; k++) {
        s+=board[5-(k+j)-i][j+k];
      }
      int n=revisaSubstring(s);
      if (n!=0)return n;
    }
  }
  //diagonales izquierda derecha
  for (int i=0; i < 3; i++) {
    for (int j=0; j < 3-i; j++) {
      String s="";
      for (int k=0; k < 4; k++) {
        s+=board[k+j+i+1][j+k];
      }
      int n=revisaSubstring(s);
      if (n!=0)return n;
    }
  }
  //Comprobar fin
  for (int i=0; i < c; i++) {
    for (int j=0; j < f; j++) {
      if (board[i][j]==0) {
        return 0;
      }
    }
  }
  return -1;
}
int revisaSubstring(String s) {
  if(s.equals("1111"))return 1;
  if(s.equals("2222"))return 2;
  return 0;
}
//Resetear
void keyPressed() {
  if (key==ENTER&&finished){
    humanTurn=empiezoYo;
    resetBoard();
    finished=false;
  }
}
void resetBoard() {
  for (int i=0; i < c; i++) {
    for (int j=0; j < f; j++) {
      board[i][j]=0;
    }
  }
}
//Animacion meter ficha
void setAnim(int column, int plr) {
  animCol=plr==1?color(255, 5, 255):color(5, 255, 255);
  animX=column*size+size/2;
  animY=0;
  animEnd=dimeEnd(column);
  anim=true;
  animPlr=plr;
}
float dimeEnd(int column) {
  int e=0;
  for (int i=f-1; i >=0; i--) {
    if (board[column][i]==0) {
      e=i;
      break;
    }
  }
  return e*size+size/2+size;
}
//Extras
boolean columnaLibre(int c) {
  for (int i=0; i < f; i++) {
    if (board[c][i]==0) {
      return true;
    }
  }
  return false;
}
boolean hayFicha(int c) {
  for (int i=0; i < f; i++) {
    if (board[c][i]!=0) {
      return true;
    }
  }
  return false;
}

ArrayList<Integer> bestChoises(int bestScore, ArrayList<Integer> choises, ArrayList<Integer> scores) {
  ArrayList<Integer> bc=new ArrayList();
  for (int i=0; i < choises.size(); i++) {
    if (scores.get(i)==bestScore) {
      bc.add(choises.get(i));
    }
  }
  return bc;
}

int dimeBestScore(ArrayList<Integer> scores) {
  int min=Integer.MAX_VALUE;
  for (int i=0; i < scores.size(); i++) {
    min=min(min, scores.get(i));
  }
  return min;
}

boolean huecoVacio(int i, int j) {
  if (board[i][j]==0) {
    return true;
  }
  return false;
}

void prints() {
  for (int i=0; i < f; i++) {
    for (int j=0; j < c; j++) {
      print(board[j][i]);
    }
    println();
  }
  println();
}
