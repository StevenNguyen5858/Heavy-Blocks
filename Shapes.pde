ArrayList<int[][]> shapes = new ArrayList<int[][]>();
boolean drawNewBlock = false;
  int[][] square = 
  {{1,1,0},
   {1,1,0},
   {0,0,0}};
  int[][] L = 
  {{0,1,0},
   {0,1,0},
   {0,1,1}};
  int[][] T = 
  {{0,1,0},
   {1,1,1},
   {0,0,0}};
  int[][] BT = 
  {{1,1,1},
   {0,1,0},
   {0,0,0}};
  int[][] BL =
  {{0,1,0},
   {0,1,0},
   {1,1,0}};
  int[][] O = 
  {{1,0,0},
   {0,0,0},
   {0,0,0}};
int[][] P = 
  {{1,0,0},
   {1,0,0},
   {0,0,0}};
int[][] SL = 
  {{1,1,1},
   {1,0,0},
   {0,0,0}};
int[][] USL =
  {{1,0,0},
   {1,1,1},
   {0,0,0}};
int[][] BUL = 
  {{1,1,1},
   {0,0,1},
   {0,0,0}};
int[][] ll = 
  {{1,1,0},
   {1,1,0},
   {1,1,0}};
int[][] kl =
  {{0,0,1},
   {1,1,1},
   {0,0,0}};
ArrayList<shape> gameBlocks = new ArrayList<shape>();
shape block = new shape();
shape trace1 = new shape();
shape trace2 = new shape();
shape trace3 = new shape();
shape trace4 = new shape();
shape trace5 = new shape();
shape trace6 = new shape();
shape trace7 = new shape();
shape trace8 = new shape();
shape trace9 = new shape();
shape trace10 = new shape();
shape player1 = new shape();
void setupShapes(){
  shapes.add(square);  
  shapes.add(L);
  shapes.add(BL);
  shapes.add(T);
  shapes.add(BT);
  shapes.add(O);
  shapes.add(SL);
  shapes.add(USL);
  shapes.add(BUL);
  shapes.add(ll);
  shapes.add(kl);
  
  gameBlocks.add(block);
  gameBlocks.add(trace1);
  gameBlocks.add(trace2);
  gameBlocks.add(trace3);
  gameBlocks.add(trace4);
  gameBlocks.add(trace5);
  gameBlocks.add(trace6);
  gameBlocks.add(trace7);
  gameBlocks.add(trace8);
  gameBlocks.add(trace9);
  gameBlocks.add(trace10);

  block = new shape(square,0,0,true);
  player1 = new shape(P,10,gridR-3,true);
}

class shape{
  private int y = 4;
  private int x = 10;
  private int[][] shape = new int[3][3];  
  private boolean isActive = false;
  shape(){
  }
  shape(int[][] shape){
    this.shape = shape;
  }
  shape(int[][] shape, int x, int y, boolean isActive){
    this.shape = shape;
    this.x = x;
    this.y = y;
    this.isActive = isActive;
  }
  int getX(){
    return x; 
  }
  void setX(int x){
    this.x = x;
  }
   int getY(){
    return y;
  }
  void setY(int y){
    this.y = y;
  }
  int[][] getShape(){
    return shape; 
  }
  void setShape(int[][] shape){  
    this.shape = shape; 
  }
  void setIsActive(boolean isActive){
    this.isActive = isActive; 
  }
  boolean isActive(){
    return isActive;
  } 
}

int[][] randomShape(){
  return shapes.get((int)(Math.random()*shapes.size()));
}
 



void drawShape(shape s){
  for(int y = 0; y<3; y++){
    for(int x = 0; x<3 ;x++){
      if(s.getShape()[y][x] == 1){
        defaultRect(#7EFF8E,0);
        rect((gridBlockWidth*(s.getX()+x))+translateGridX,(gridBlockHeight*(s.getY()+y))+translateGridY,gridBlockWidth,gridBlockHeight);
      }
    }
  }
}

float animateTranslatePlayerX = 0;
int animateTranslatePlayerY = 0;
void drawPlayer(shape s){
   for(int y = 0; y<3; y++){
    for(int x = 0; x<3 ;x++){
      if(s.getShape()[y][x] == 1){
        defaultRect(#E300F0,0);
        rect((gridBlockWidth*(s.getX()+x))+translateGridX+animateTranslatePlayerX,(gridBlockHeight*(s.getY()+y))+translateGridY+animateTranslatePlayerY,gridBlockWidth,gridBlockHeight);
      }
    }
  }
  /*
  if(Math.abs(playerFrameWalk)!=0 && Math.abs(playerFrameWalk)<=4){
    animateTranslatePlayerX = (25/3)*playerFrameWalk;
  }else{
    animateTranslatePlayerX = 0;
  }
  //--2image(tempWalk,(gridBlockWidth*(s.getX()))+translateGridX+animateTranslatePlayerX,(gridBlockHeight*(s.getY()))+translateGridY+animateTranslatePlayerY);
  if(playerFrameWalk == 5){
    playerFrameWalk = 1;
  }
  if(playerFrameWalk == -5){
    playerFrameWalk = -1;  
  }
  movePlayerHorizontal();
  --2*/
  //--2playerChrushCheck();
}
/*--2
void playerChrushCheck(){
  if(5 == playerFrameWalk || playerFrameWalk == 1){
  P[0][1] = 1;
  P[1][1] = 1;
  
  P[0][2] = 1;
  P[1][2] = 1; 
  }
  else if(-5 == playerFrameWalk || playerFrameWalk == -1){
  P[0][0] = 1;
  P[1][0] = 1;
  
  P[0][1] = 1;
  P[1][1] = 1;
  }
  else if(3<=playerFrameWalk){
  P[0][0] = 0;
  P[1][0] = 0;
  
  P[0][1] = 0;
  P[1][1] = 0;
  
  P[0][2] = 1;
  P[1][2] = 1;
  }
  else if(-3>=playerFrameWalk){
  P[0][0] = 1;
  P[1][0] = 1;
  
  P[0][1] = 0;
  P[1][1] = 0;
  
  P[0][2] = 0;
  P[1][2] = 0;
  }
  else if(0<playerFrameWalk){
  P[0][0] = 0;
  P[1][0] = 0;
  
  P[0][2] = 1;
  P[1][2] = 1;
  }
  else if(0>playerFrameWalk){
  P[0][0] = 1;
  P[1][0] = 1;
 
  P[0][2] = 0;
  P[1][2] = 0;
  }
}
*/
