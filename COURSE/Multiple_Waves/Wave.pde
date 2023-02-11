class Wave{
 
  float T,A,phase;
  
  Wave(int numWaves){
   
    A=random(360/numWaves);
    T=random(180,720);
    phase=random(TWO_PI);
    println(A);
  }
  
  float f(float x){
     
    return sin((TWO_PI*x/T)+phase)*A;
    
  }
  
}
