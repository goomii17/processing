void machineRand() {
  humanTurn=true;
  putRandom('O');
}

void playerRand() {
  humanTurn=false;
  putRandom('X');
}
void putRandom(char c) {
  ArrayList<int[][]> pos=new ArrayList();
  for (int i=0; i < tam; i++) {
    for (int j=0; j < tam; j++) {
      if (board[i][j]==' ') {
        int[][] d={{i}, {j}};
        pos.add(d);
      }
    }
  }
  if (pos.size()!=0) {
    int decision=int(random(pos.size()));

    board[pos.get(decision)[0][0]][pos.get(decision)[1][0]]=c;
  }
}
