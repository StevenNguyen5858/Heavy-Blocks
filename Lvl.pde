int[] levelStars = {0,0,0,
                    0,0,0,
                    0,0,0};
ArrayList<level> levels = new ArrayList<level>();
level lvl1 = new level();
level lvl2 = new level();
level lvl3 = new level();
level lvl4 = new level();
int[] startH = {1,0,0,0};


void setupLevels(){
  //Format is repeated for each new level:
  //BlockStarts:
  int[] lvl1X = {17,19,19, 17, 15,15, 12, 15, 13,9,14,12};
  int[] shape1 = {9,9,9, 9, 0,0, 0, 0, 0,10,5,5};
  int[] blockSpeed1 = {0,5,5, 350, 40,35, 30, 550, 40,40,35,35};
  //PlayerStart:
  int startX1 = 0;
  int startY1 = gridR-((lvl+startH[lvl-1])*2+5);
  boolean[] gBIA1 = {false,false,false,false,false,false,false,false,false,false,false};
  //Other:
  boolean hasControl1 = false;
  int winX1 = 21;
  int winY1 = gridR-((lvl+startH[lvl-1])*2+5);
  int mainBlockSpeed1 = 700;
  int[] star1 = {6,9};
  
  //BlockStarts:
  int[] lvl2X = {17,19,19,19, 1,3,5, 17, 16, 7,9, 17, 1,3,5,7,9, 1,3,5,7,9, 11,14,14, 16,16,16, 11,17};
  int[] shape2 = {0,0,0,0, 0,0,0, 0, 5, 0,0, 0, 0,0,0,0,0, 0,0,0,0,0, 7,0,0, 5,5,5, 8,0}; 
  int[] blockSpeed2 = {0,5,5,210, 40,35,30, 50, 50, 40,40, 120, 35,30,25,20,15, 30,30,30,30,30, 50,120,5, 5,5,5, 850,50};
  //PlayerStart:
  int startX2 = 0;
  int startY2 = gridR-((lvl+startH[lvl-1])*2+5);
  boolean[] gBIA2 = {true,false,false,false,false,false,false,false,false,false,false};
  //Other:
  boolean hasControl2 = true; 
  int winX2 = 21;
  int winY2 = gridR-((lvl+startH[lvl-1])*2+5);;
  int mainBlockSpeed2 = 250;
  int[] star2 = {4,27};
  
  //BlockStarts:
  int[] lvl3X = {3,6,9,3,18,15};
  int[] shape3 = {0,1,2,3,0,1};
  int[] blockSpeed3 = {40,50,50,150,150,50};
  //PlayerStart:
  int startX3 = 0;
  int startY3 = gridR-11;
  boolean[] gBIA3 = {true,false,false,false,false,false,false,false,false,false,false};
  //Other:
  boolean hasControl3 = true;
  int winX3 = 0;
  int winY3 = 0;
  int mainBlockSpeed3 = 700;
  int[] star3 = {0,0,0};
  
  //BlockStarts:
  int[] lvl4X = {3,6,9,3,18,15};
  int[] shape4 = {0,1,2,3,0,1};
  int[] blockSpeed4 = {40,50,50,150,150,50};
  //PlayerStart:
  int startX4 = 0;
  int startY4 = gridR-3;
  boolean[] gBIA4 = {true,false,false,false,false,false,false,false,false,false,false};
  //Other:
  boolean hasControl4 = true;
  int winX4 = 0;
  int winY4 = 0;
  int mainBlockSpeed4 = 700;
  int[] star4 = {0,0,0};
  
 
  gameBlockIsActive.add(gBIA1);

  gameBlockIsActive.add(gBIA2);

  gameBlockIsActive.add(gBIA3);
  
  gameBlockIsActive.add(gBIA4);
  
  lvl1 = new level(lvl1X, shape1, startX1, startY1, hasControl1, winX1, winY1, mainBlockSpeed1, blockSpeed1, star1);
  lvl2 = new level(lvl2X, shape2, startX2, startY2, hasControl2, winX2, winY2, mainBlockSpeed2, blockSpeed2, star2);
  lvl3 = new level(lvl3X, shape3, startX3, startY3, hasControl3, winX3, winY3, mainBlockSpeed3, blockSpeed3, star3);
  lvl4 = new level(lvl4X, shape4, startX4, startY4, hasControl4, winX4, winY4, mainBlockSpeed4, blockSpeed4, star4);

  levels.add(lvl1);
  levels.add(lvl2);
  levels.add(lvl3);
  levels.add(lvl4);
  
}
void setupLevel(){
  lvlX0 = levels.get(lvl-1).getLvlX();
  lvlY0 = 0;
  shapes0 = levels.get(lvl-1).getShapes();
  startX0 = levels.get(lvl-1).getStartX();
  startY0 = levels.get(lvl-1).getStartY();
  plannedIndex0 = levels.get(lvl-1).getPlannedIndex();
  hasControl0 = levels.get(lvl-1).hasControl();
  winX0 = levels.get(lvl-1).getWinX();
  winY0 = levels.get(lvl-1).getWinY();
  mainBlockSpeed0 = levels.get(lvl-1).getMainBlockSpeed();
  blockSpeed0 = levels.get(lvl-1).getBlockSpeed();
  star0 = levels.get(lvl-1).getStar();
}

class level{
  //Block starts
  int[] lvlX;
  int[] shapes;
  //Player starts
  int startX;
  int startY;
  int plannedIndex = 0;
  //other
  boolean hasControl = true;
  int exitX;
  int winX;
  int winY;
  int mainBlockSpeed;
  int[] blockSpeed;
  int[] star;
  
  level(){ 
  }
  level(int[] lvlX, int[] shapes, int startX, int startY, boolean hasControl, int winX, int winY, int mainBlockSpeed, int[] blockSpeed, int[] star){
    this.lvlX = lvlX;
    this.shapes = shapes;
    this.startX = startX;
    this.startY = startY;
    this.hasControl = hasControl;
    this.winX = winX;
    this.winY = winY;
    this.mainBlockSpeed = mainBlockSpeed;
    this.blockSpeed = blockSpeed;
    this.star = star;
  }
  
  
  void setLvlX(int[] lvlX){
    this.lvlX = lvlX;  
  }
  int[] getLvlX(){
    return lvlX;
  }
  void setStartX(int startX){
      this.startX = startX;
  }
  int getStartX(){
    return startX;
  }
  void setShapes(int[] shapes){
    this.shapes = shapes;
  }
  int getStartY(){
    return startY;  
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
  void setMainBlockSpeed(int mainBlockSpeed){
    this.mainBlockSpeed = mainBlockSpeed;  
  }
  int getMainBlockSpeed(){
    return mainBlockSpeed;  
  }
  int[] getBlockSpeed(){
    return blockSpeed;  
  }
  int[] getStar(){
    return star;
  }
}


void changeGameValue(int indexX, int indexY){
 
  
}
