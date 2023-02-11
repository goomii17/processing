void aiPick() {
    ArrayList<Integer> pos=dimeEmpty();
    println("vacias: "+pos);
    ArrayList<Integer> scores=new ArrayList();
    ArrayList<Integer> choises=new ArrayList();
    for (int i=0; i < pos.size(); i++) {
        meteFicha(pos.get(i));
        scores.add(minimax(0, Integer.MIN_VALUE, Integer.MAX_VALUE, true));
        choises.add(pos.get(i));
        quitaFicha(pos.get(i));
        println("Pos:", pos.get(i), " Score:", scores.get(i));
    }
    //println("Puntos: "+scores);
    ArrayList<Integer> bc=bestChoises(dimeBestScore(scores), choises, scores);
    setAnim(bc.get(int(random(bc.size()))), 2);
    humanTurn=true;
}

int minimax(int depth, int alpha, int beta, boolean humanT) {
    if (depth<6) {
        int w=dimeWinner();
        if (w==-1) {
            return 0;
        }
        if (w==1) {
            return 1;
        }
        if (w==2) {
            return-1;
        }
        if (humanT) {
            int bestScore=Integer.MIN_VALUE;
            ArrayList<Integer> pos=dimeEmpty();
            for (int i=0; i < pos.size(); i++) {
                meteFicha(pos.get(i));
                int score=minimax(depth+1, alpha, beta, false);
                alpha=max(alpha, score);
                bestScore=max(bestScore, score);
                quitaFicha(pos.get(i));
                if (bestScore==1)return 1;
                //if (beta<=alpha) {
                //    println("Alpha>=beta");
                //    return 1;
                //}
            }
            return bestScore;
        } else {
            int bestScore=Integer.MAX_VALUE;
            ArrayList<Integer> pos=dimeEmpty();
            for (int i=0; i < pos.size(); i++) {
                meteFicha(pos.get(i));
                int score=minimax(depth+1, alpha, beta, true);
                beta=min(beta, score);
                bestScore=min(bestScore, score);
                quitaFicha(pos.get(i));
                if (bestScore==-1)return -1;
                //if (beta<=alpha) {
                //    println("Alpha>beta");
                //    return 1;
                //}
            }
            return bestScore;
        }
    } else {
        return 0;
    }
}
