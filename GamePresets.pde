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

ArrayList<int[]> plannedTraceStartX = new ArrayList<int[]>();
ArrayList<int[]> plannedTraceStartY = new ArrayList<int[]>();

ArrayList<boolean[]> gameBlockIsActive = new ArrayList<boolean[]>();
ArrayList<Boolean> hasControl = new ArrayList<Boolean>();

int mainBlockSpeed = 1000;
//----------@----------@----------@----------@----------@----------@----------  
void setupPresets(){

}
