int lvl = 1;
int gridC = 22;
int gridR = 20;
int gridBlockWidth = 25;
int gridBlockHeight = 25;
int translateGridX = 24;
int translateGridY = 3;
boolean[][] binaryBlocks = new boolean[gridC][gridR]; 
boolean[][] binaryBlocksPB = new boolean[gridC][gridR]; 
boolean win = false;

ArrayList<int[]> plannedX = new ArrayList<int[]>();
ArrayList<int[]> plannedY = new ArrayList<int[]>();
ArrayList<int[]> plannedS = new ArrayList<int[]>();
ArrayList<Integer> plannedPlayerX = new ArrayList<Integer>();
ArrayList<Integer> plannedPlayerY = new ArrayList<Integer>();
ArrayList<boolean[]> gameBlockIsActive = new ArrayList<boolean[]>();
ArrayList<Boolean> hasControl = new ArrayList<Boolean>();

int[] plannedIndex = {0,0,0,0,0,0,0,0,0};
//----------@----------@----------@----------@----------@----------@----------  
void setupLevels(){
  int[] lvl1X = {3,6,9,3,18,15};
  int[] lvl1Y = {0,0,0,0,0,0};
  int[] shape1 = {0,1,2,3,0,1};
  boolean hasControl1 = false;
  int startX1 = 0;
  int startY1 = gridR-7;
  boolean[] gBIA1 = {false,false,false,false,false,false,false,false,false,false,false};
  
  int[] lvl2X = {3,6,9,3,18,15};
  int[] lvl2Y = {0,0,0,0,0,0};
  int[] shape2 = {0,1,2,3,0,1};
  boolean hasControl2 = true;
  int startX2 = 0;
  int startY2 = gridR-9;
  boolean[] gBIA2 = {true,false,false,false,false,false,false,false,false,false,false};
  
  int[] lvl3X = {3,6,9,3,18,15};
  int[] lvl3Y = {2,2,2,2,2,2};
  int[] shape3 = {0,1,2,3,0,1};
  boolean hasControl3 = true;
  int startX3 = 0;
  int startY3 = gridR-11;
  boolean[] gBIA3 = {true,false,false,false,false,false,false,false,false,false,false};
  
  int[] lvl4X = {3,6,9,3,18,15};
  int[] lvl4Y = {2,2,2,2,2,2};
  int[] shape4 = {0,1,2,3,0,1};
  boolean hasControl4 = true;
  int startX4 = 0;
  int startY4 = gridR-3;
  boolean[] gBIA4 = {true,false,false,false,false,false,false,false,false,false,false};
  
  plannedX.add(lvl1X);
  plannedY.add(lvl1Y);
  plannedS.add(shape1);
  hasControl.add(hasControl1);
  plannedPlayerX.add(startX1);
  plannedPlayerY.add(startY1);
  gameBlockIsActive.add(gBIA1);
  
  plannedX.add(lvl2X);
  plannedY.add(lvl2Y);
  plannedS.add(shape2);
  hasControl.add(hasControl2);
  plannedPlayerX.add(startX2);
  plannedPlayerY.add(startY2);
  gameBlockIsActive.add(gBIA2);
  
  plannedX.add(lvl3X);
  plannedY.add(lvl3Y);
  plannedS.add(shape3);
  hasControl.add(hasControl3);
  plannedPlayerX.add(startX3);
  plannedPlayerY.add(startY3);
  gameBlockIsActive.add(gBIA3);
  
  plannedX.add(lvl4X);
  plannedY.add(lvl4Y);
  plannedS.add(shape4);
  hasControl.add(hasControl4);
  plannedPlayerX.add(startX4);
  plannedPlayerY.add(startY4);
  gameBlockIsActive.add(gBIA4);
}
