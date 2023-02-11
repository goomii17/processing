int tam=3;
boolean jugadorInicial=true;
boolean automatic=false;
boolean ai=true;
int automaticSpeed=10;

char[][] board=new char[tam][tam];
boolean finished=false, humanTurn;
float size;
int maxDepth;

void setup() {

  size(720, 720);

  size=width/tam;

  for (int i=0; i < board.length; i++) {
    for (int j=0; j < tam; j++) {
      board[i][j]=' ';
    }
  }
  humanTurn=jugadorInicial;

  if (tam==3) {
    maxDepth=9;
  } else if (tam==4) {
    maxDepth=7;
  } else if (tam==5) {
    maxDepth=6;
  } else if (tam==6) {
    maxDepth=5;
  } else if (tam==7) {
    maxDepth=5;
  } else if (tam==8) {
    maxDepth=4;
  } else {
    maxDepth=4;
  }
}

void draw() {
  background(255);
  printBoard();
  checkWinner();
  if (!finished&&!humanTurn&&!ai) {
    machineRand();
  }
  if (!finished&&automatic) {
    playerRand();
  }
  if (!finished&&!humanTurn&&ai) {
    machineAi();
  }
  if (automatic&&finished) {
    resetBoard();
    finished=false;
  }
}
//Dibujar tablero
void printBoard() {
  //draw board
  rectMode(CORNER);
  strokeWeight(3);
  noFill();
  stroke(0);
  for (int i=0; i < tam; i++) {
    for (int j=0; j < tam; j++) {
      rect(i*size, j*size, size, size);
    }
  }
  if (automatic) {
    frameRate(automaticSpeed);
  }
  //draw marks
  for (int i=0; i < tam; i++) {
    for (int j=0; j < tam; j++) {
      if (board[i][j]=='X') {
        stroke(255, 5, 255);
        line(i*size+size/4, j*size+size/4, (i+1)*size-size/4, (j+1)*size-size/4);
        line((i+1)*size-size/4, j*size+size/4, i*size+size/4, (j+1)*size-size/4);
      } else if (board[i][j]=='O') {
        stroke(5, 255, 255);
        ellipseMode(CENTER);
        ellipse(i*size+size/2, j*size+size/2, size/2, size/2);
      }
    }
  }
}
//Poner X humano
void mousePressed() {
  if (humanTurn&&!finished) {
    int i=int(mouseX/size);
    int j=int(mouseY/size);
    if (board[i][j]==' ') {
      board[i][j]='X';
      humanTurn=false;
    }
  }
}

//Resetear
void keyPressed() {
  if (key==ENTER) {
    if (finished) {
      resetBoard();
      finished=false;
    }
  }
}
void resetBoard() {
  humanTurn=jugadorInicial;
  for (int i=0; i < tam; i++) {
    for (int j=0; j < tam; j++) {
      board[i][j]=' ';
    }
  }
}
//Comprobar ganador
void checkWinner() {
  char c=dimeWinner();
  if (!finished) {
    if (c!='N') {
      if (c=='T') {
        println("Empate !!!   (Pulsa Enter para volver a jugar)");
      } else {
        println("Ganan los "+c+" !!!  (Pulsa Enter para volver a jugar)");
      }
      finished=true;
    }
  }
}
char dimeWinner() {
  if (tam>4) {
    if (superTie())return 'T';
  }
  boolean t=true;
  //Comprobar filas
  for (int j=0; j < tam; j++) {
    if (board[0][j]!=' ') {
      char pl=board[0][j];
      t=true;
      for (int i=1; i < tam; i++) {
        if (board[i][j]!=pl) {
          t=false;
        }
      }
      if (t) {
        return pl;
      }
    }
  }
  //Comprobar columnas
  for (int i=0; i < tam; i++) {
    if (board[i][0]!=' ') {
      char pl=board[i][0];
      t=true;
      //println(pl);
      for (int j=1; j < tam; j++) {
        if (board[i][j]!=pl) {
          t=false;
        }
      }
      if (t) {
        return pl;
      }
    }
  }
  //Comprobar diagonals
  char pl=board[0][0];
  if (pl!=' ') {
    t=true;
    for (int i=1; i < tam; i++) {
      if (board[i][i]!=pl) {
        t=false;
      }
    }
    if (t)return pl;
  }
  pl=board[0][tam-1];
  if (pl!=' ') {
    t=true;
    for (int i=1; i < tam; i++) {
      if (board[i][tam-1-i]!=pl) {
        t=false;
      }
    }
    if (t)return pl;
  }
  t=true;
  for (int i=0; i < tam; i++) {
    for (int j=0; j< tam; j++) {
      if (board[i][j]==' ') {
        t=false;
        break;
      }
    }
    if (!t)break;
  }
  if (t)return 'T';
  return 'N';
}

//Comprueba empate anticipado
boolean superTie() {

  if (search('X')&&search('O')) {
    return true;
  }
  return false;
}
boolean search(char c) {

  for (int i=0; i < tam; i++) {
    boolean esta=false;
    for (int j=0; j < tam; j++) {
      if (c==board[i][j]) {
        esta=true;
      }
    }
    if (!esta) {
      return false;
    }
  }

  for (int j=0; j < tam; j++) {
    boolean esta=false;
    for (int i=0; i < tam; i++) {
      if (c==board[i][j]) {
        esta=true;
      }
    }
    if (!esta) {
      return false;
    }
  }
  boolean esta=false;
  for (int i=0; i < tam; i++) {

    if (c==board[i][i]) {
      esta=true;
    }
  }
  if (!esta) {
    return false;
  }
  esta=false;
  for (int i=0; i < tam; i++) {

    if (c==board[i][tam-i-1]) {
      esta=true;
    }
  }
  if (!esta) {
    return false;
  }
  return true;
}

//Evaluar tablero
int evaluateBoard() {
  int value=0;
  ArrayList<String> rcd=new ArrayList();
  for (int i=0; i < tam; i++) {
    String s="";
    for (int j=0; j < tam; j++) {
      s+=board[i][j];
    }
    rcd.add(s);
  }
  for (int j=0; j < tam; j++) {
    String s="";
    for (int i=0; i < tam; i++) {
      s+=board[i][j];
    }
    rcd.add(s);
  }
  String s="";
  for (int i=0; i < tam; i++) {
    s+=board[i][i];
  }
  rcd.add(s);
  s="";
  for (int i=0; i < tam; i++) {
    s+=board[i][tam-i-1];
  }
  rcd.add(s);

  for (int i=0; i < rcd.size(); i++) {
    if (twoElem(rcd.get(i))) {
      char elem=dimeElem(rcd.get(i));
      if (elem=='X') {
        int v=0;
        for (int j=0; j < tam; j++) {
          if (rcd.get(i).charAt(j)==elem) {
            v++;
          }
        }
        if(v==tam-3)value+=2;
        if(v==tam-2)value+=5;
        if(v==tam-1)value+=10;
      } else {
        int v=0;
        for (int j=0; j < tam; j++) {
          if (rcd.get(i).charAt(j)==elem) {
            v++;
          }
        }
        if(v==tam-3)value-=2;
        if(v==tam-2)value-=5;
        if(v==tam-1)value-=10;
      }
    }
  }
  return value;
}

boolean twoElem(String s){
  ArrayList<Character> chars=new ArrayList();
  chars.add(s.charAt(0));
  for(int i=1; i < s.length(); i++){
     if(!chars.contains(s.charAt(i))){
        chars.add(s.charAt(i));
     }
  }
  if(chars.size()==2&&chars.contains(' '))return true;
  return false;
}

char dimeElem(String s){
  for(int i=0; i < s.length(); i++){
     if(s.charAt(i)!=' ')return s.charAt(i);
  }
  return ' ';
}

//Extras
void prints() {
  for (int j=0; j < tam; j++) {
    for (int i=0; i < tam; i++) {
      if (board[i][j]==' ') {
        print("-");
      } else {
        print(board[i][j]);
      }
    }
    println();
  }
  println();
}
int dimeMin(ArrayList<Integer> nums) {
  int min=Integer.MAX_VALUE;
  for (int i=0; i < nums.size(); i++) {
    min=min(min, nums.get(i));
  }
  return min;
}
