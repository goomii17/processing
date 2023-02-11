void machineAi() {
  ArrayList<Integer> scores=new ArrayList();
  ArrayList<int[]> moves=new ArrayList();
  for (int i=0; i < tam; i++) {
    for (int j=0; j < tam; j++) {
      if (board[i][j]==' ') {
        board[i][j]='O';
        scores.add(minimax(0, Integer.MIN_VALUE, Integer.MAX_VALUE, true));
        int[] m={i, j};
        moves.add(m);
        board[i][j]=' ';
      }
    }
  }
  int min=dimeMin(scores);
  ArrayList<int[]> posibilidades=new ArrayList();
  for (int i=0; i < moves.size(); i++) {
    if (scores.get(i)==min) {
      posibilidades.add(moves.get(i));
    }
  }
  int[] bestMove=posibilidades.get(int(random(posibilidades.size())));
  board[bestMove[0]][bestMove[1]]='O';
  humanTurn=true;
}

int minimax(int depth, int alpha, int beta, boolean humanT) {
  char winner=dimeWinner();
  if (winner=='X') {
    return 100;
  } else if (winner=='O') {
    return -100;
  } else if (winner=='T') {
    return 0;
  }
  if (depth<maxDepth) {
    if (humanT) {
      int bestScore=Integer.MIN_VALUE;
      for (int i=0; i < tam; i++) {
        for (int j=0; j < tam; j++) {
          if (board[i][j]==' ') {

            board[i][j]='X';

            int score=minimax(depth+1, alpha, beta, false);
            alpha=max(alpha, score);
            bestScore=max(score, bestScore);

            board[i][j]=' ';
            if (bestScore==1)break;
            if (beta<=alpha)break;
          }
        }
      }
      return bestScore;
    } else {

      int bestScore=Integer.MAX_VALUE;

      for (int i=0; i < tam; i++) {
        for (int j=0; j < tam; j++) {
          if (board[i][j]==' ') {

            board[i][j]='O';

            int score=minimax(depth+1, alpha, beta, true);
            beta=min(beta, score);
            bestScore=min(bestScore, score);

            board[i][j]=' ';

            if (beta<=alpha)break;
            if (bestScore==-1)break;
          }
        }
      }
      return bestScore;
    }
  } else {
    //return evaluateBoard();
    return 0;
  }
}
