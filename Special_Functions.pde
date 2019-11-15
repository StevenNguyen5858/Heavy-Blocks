boolean waitedOnce = false;
boolean pressedContinue = false;
boolean pressedSave = false;
boolean setupCustomAnimate = false;
int lvlLock = 0;
//----------@----------@----------@----------@----------@----------@----------  
//----------@----------@----------@----------@----------@----------@----------  
void buttonFunctions(button b){
  String name = b.getName();
  
  if(name.equals("Levels") || name.equals("backToLevelsWB")){
    activatePage(levelsP); 
  }
  if(name.equals("Play")){
    lvlLock = lvl;
    activatePage(play1); 
    setgBIA();
    setupLevel();
  }
  if(name.equals("escToMainScreen")){
    activatePage(main);
  }
  if(name.equals("tempLevels")){
    lvl = b.getButtonTag();
    lvlLock = lvl;
    activatePage(play1);
    setgBIA();
    setupLevel();
  }
  if(name.equals("PlayB")){
    activatePage(play2);
    customCycle = true;
    waitedOnce = false;
    setupCustomAnimate = true;
  }
  if(name.equals("NextWB")){
    lvl = lvlLock+1;
    activatePage(play1);
    setgBIA();
    setupLevel();
  }
  if(name.equals("Pause")){
    activatePage(pause);
  }
  if(name.equals("Continue")){
    activatePage(play2); 
    customCycle = true;
    waitedOnce = false;
    pressedContinue = true;
  }
  if(name.equals("Restart")){
    clearLvlData();
    activatePage(play2);  
  }
  if(name.equals("Save & Exit")){
    pressedSave = true;
    activatePage(main); 
  }
  if(name.equals("MainScreen")){
    clearLvlData();
    activatePage(main);  
  }
  
}


void revertButtonFunctions(button b){
  String name =  b.getName(); 
}
//----------@----------@----------@----------@----------@----------@----------  
//----------@----------@----------@----------@----------@----------@----------  
//Draws any button object that is called: drawButton(a button);
void drawButton(button b){
  String name = b.getName();
  defaultRect(b.getRed(),b.getGreen(),b.getBlue(),b.getStroke());
  rect(b.getX(),b.getY(),b.getW(),b.getH());
  
  if(name.equals("Play")|| name.equals("Levels") || name.equals("Controls") || name.equals("Settings")){
    defaultText(255,255,fitTextHeight(b.getH()));
    text(b.getName(),b.getX()+b.getW()/2-(textWidth(b.getName()))/2,b.getY()+(b.getH()*.83) ); 
  }
  if(name.equals("tempLevels")){
    defaultText(0,0,25);
    text("lvl." + b.getButtonTag(),b.getX()+b.getW()/2-(textWidth("lvl"+b.getButtonTag()))/2,b.getY()+(b.getH()*.50) ); 
    for(int i = 1; i<4; i++){
      defaultRect(255,234,0,0);
      rect(b.getX()-5+20*i,b.getY()+(b.getH()*.70), 10,10);
    }
  }
  if(name.equals("PlayB")){
    defaultText(0,225,31,-1,40);
    text("Play",b.getX()+(b.getW()-textWidth("Play"))/2,sH/2+5);
  }
  if(name.equals("Pause")){
    defaultRect(-1,0);
    rect(64,14,6,16);
    rect(74,14,6,16);
  }
  if(name.equals("Continue")|| name.equals("Restart") || name.equals("Save & Exit") || name.equals("MainScreen")){
    defaultRect(b.getRed(),b.getGreen(),b.getBlue(),b.getStroke());
    rect(b.getX()-2,b.getY(),b.getW()+3,b.getH());
    defaultText(255,255,fitTextHeight(b.getH()));
    text(b.getName(),b.getX()+b.getW()/2-(textWidth(b.getName()))/2,b.getY()+(b.getH()*.83) ); 
  }
  if(name.equals("backToLevelsWB")){
    defaultRect(255,b.getStroke());
    rect(b.getX()+4,b.getY()+5,7,b.getH()/5);
    rect(b.getX()+4,b.getY()+b.getH()/4+6,7,b.getH()/5);
    rect(b.getX()+4,b.getY()+b.getH()/2+7,7,b.getH()/5);
    rect(b.getX()+15,b.getY()+5,b.getW()-19,b.getH()/5);
    rect(b.getX()+15,b.getY()+b.getH()/4+6,b.getW()-19,b.getH()/5);
    rect(b.getX()+15,b.getY()+b.getH()/2+7,b.getW()-19,b.getH()/5);
  }
  if(name.equals("NextWB")){
    defaultRect(#07DE13,b.getStroke());
    beginShape();
    vertex(playNextWB.getX()+9,playNextWB.getY()+5);
    vertex(playNextWB.getX()+9,playNextWB.getY()+playNextWB.getH()-7);
    vertex(playNextWB.getX()+playNextWB.getW()-7,playNextWB.getY()+playNextWB.getH()/2);
    vertex(playNextWB.getX()+9,playNextWB.getY()+5);
    endShape();
  }
}
 
 
void resetBinaryBlocks(){
  for(int y = 0; y<gridR; y++){
    for(int x = 0; x<gridC; x++){
      binaryBlocks[x][y] = false;
      binaryBlocksPB[x][y] = false;
    }
  }
}

void setgBIA(){
  for(int i = 0; i<gameBlocks.size(); i++){
    gameBlocks.get(i).setIsActive(gameBlockIsActive.get(lvl-1)[i]);
  }
}

void clearLvlData(){
  plannedIndex0 = 0;
  waitedOnce = false;
  pressedContinue = false;
  pressedSave = false;
  resetBinaryBlocks();
}
