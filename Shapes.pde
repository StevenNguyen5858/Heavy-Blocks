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
  shapes.add(T);
  shapes.add(BL);
  shapes.add(O);
  
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
  if(playerFrameWalk == 4){
    playerFrameWalk = 0;  
  }
  if(playerFrameWalk == -4){
    playerFrameWalk = 0;  
  }
}

float animateTranslatePlayerX = 0;
int animateTranslatePlayerY = 0;
void drawPlayer(shape s){
  if(Math.abs(playerFrameWalk)>=1 && Math.abs(playerFrameWalk)<=3){
    animateTranslatePlayerX = playerFrameWalk*6.25;
  }else{
    animateTranslatePlayerX = 0;
  }
  for(int y = 0; y<3; y++){
    for(int x = 0; x<3 ;x++){
      if(s.getShape()[y][x] == 1){
        defaultRect(playerColor,0);
        rect((gridBlockWidth*(s.getX()+x))+translateGridX+animateTranslatePlayerX,(gridBlockHeight*(s.getY()+y))+translateGridY+animateTranslatePlayerY,gridBlockWidth,gridBlockHeight);
      }
    }
  }
}
