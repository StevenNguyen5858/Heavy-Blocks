ArrayList<level> levels = new ArrayList<level>();
level lvl1 = new level();
level lvl2 = new level();
level lvl3 = new level();
level lvl4 = new level();
void setupLevels(){
  //Format is repeated for each new level:
  //BlockStarts:
  int[] lvl1X = {3,6,9,3,18,15};
  int[] lvl1Y = {0,0,0,0,0,0};
  int[] shape1 = {0,1,2,3,0,1};
  //PlayerStart:
  int startX1 = 0;
  int startY1 = gridR-7;
  boolean[] gBIA1 = {false,false,false,false,false,false,false,false,false,false,false};
  //Other:
  boolean hasControl1 = false;
  int winX1 = 21;
  int winY1 = gridR-7;
  
  //BlockStarts:
  int[] lvl2X = {3,6,9,3,18,15};
  int[] lvl2Y = {0,0,0,0,0,0};
  int[] shape2 = {0,1,2,3,0,1};
  //PlayerStart:
  int startX2 = 0;
  int startY2 = gridR-9;
  boolean[] gBIA2 = {true,false,false,false,false,false,false,false,false,false,false};
  //Other:
  boolean hasControl2 = true; 
  int winX2 = 0;
  int winY2 = 0;
  
  //BlockStarts:
  int[] lvl3X = {3,6,9,3,18,15};
  int[] lvl3Y = {2,2,2,2,2,2};
  int[] shape3 = {0,1,2,3,0,1};
  //PlayerStart:
  int startX3 = 0;
  int startY3 = gridR-11;
  boolean[] gBIA3 = {true,false,false,false,false,false,false,false,false,false,false};
  //Other:
  boolean hasControl3 = true;
  int winX3 = 0;
  int winY3 = 0;
  
  //BlockStarts:
  int[] lvl4X = {3,6,9,3,18,15};
  int[] lvl4Y = {2,2,2,2,2,2};
  int[] shape4 = {0,1,2,3,0,1};
  //PlayerStart:
  int startX4 = 0;
  int startY4 = gridR-3;
  boolean[] gBIA4 = {true,false,false,false,false,false,false,false,false,false,false};
  //Other:
  boolean hasControl4 = true;
  int winX4 = 0;
  int winY4 = 0;
 
  gameBlockIsActive.add(gBIA1);

  gameBlockIsActive.add(gBIA2);

  gameBlockIsActive.add(gBIA3);
  
  gameBlockIsActive.add(gBIA4);
  
  lvl1 = new level(lvl1X, lvl1Y, shape1, startX1, startY1, hasControl1, winX1, winY1);
  lvl2 = new level(lvl2X, lvl2Y, shape2, startX2, startY2, hasControl2, winX2, winY2);
  lvl3 = new level(lvl3X, lvl3Y, shape3, startX3, startY3, hasControl3, winX3, winY3);
  lvl4 = new level(lvl4X, lvl4Y, shape4, startX4, startY4, hasControl4, winX4, winY4);

  levels.add(lvl1);
  levels.add(lvl2);
  levels.add(lvl3);
  levels.add(lvl4);
  
}
void setupLevel(){
  lvlX0 = levels.get(lvl-1).getLvlX();
  lvlY0 = levels.get(lvl-1).getLvlY();
  shapes0 = levels.get(lvl-1).getShapes();
  startX0 = levels.get(lvl-1).getStartX();
  startY0 = levels.get(lvl-1).getStartY();
  plannedIndex0 = levels.get(lvl-1).getPlannedIndex();
  hasControl0 = levels.get(lvl-1).hasControl();
  winX0 = levels.get(lvl-1).getWinX();
  winY0 = levels.get(lvl-1).getWinY();
}
class level{
  //Block starts
  int[] lvlX;
  int[] lvlY;
  int[] shapes;
  //Player starts
  int startX;
  int startY;
  int plannedIndex = 0;
  //other
  boolean hasControl = true;
  int winX;
  int winY;
  
  level(){ 
  }
  level(int[] lvlX, int[] lvlY, int[] shapes, int startX, int startY, boolean hasControl, int winX, int winY){
    this.lvlX = lvlX;
    this.lvlY = lvlY;
    this.shapes = shapes;
    this.startX = startX;
    this.startY = startY;
    this.hasControl = hasControl;
    this.winX = winX;
    this.winY = winY;
  }
  
  
  void setLvlX(int[] lvlX){
    this.lvlX = lvlX;  
  }
  void setLvlY(int[] lvlY){
    this.lvlY = lvlY;  
  }
  int[] getLvlX(){
    return lvlX;
  }
  int[] getLvlY(){
    return lvlY;
  }
  void setStartX(int startX){
      this.startX = startX;
  }
  void setStartY(int startY){
    this.startY = startY;  
  }
  int getStartX(){
    return startX;
  }
  int getStartY(){
    return startY;  
  }
  void setShapes(int[] shapes){
    this.shapes = shapes;
  }
  int[] getShapes(){
    return this.shapes;
  }
  int getPlannedIndex(){
    return plannedIndex;
  }
  void setHasControl(boolean hasControl){
    this.hasControl = hasControl;
  }
  boolean hasControl(){
    return hasControl;
  }
  void setWinX(int winX){
     this.winX = winX;
  }
  void setWinY(int winY){
     this.winY = winY;
  }
  int getWinX(){
    return winX;
  }
  int getWinY(){
    return winY;
  }
}
