boolean waitedOnce = false;
boolean pressedContinue = false;
boolean pressedSave = false;
boolean setupCustomAnimate = false;
int lvlLock = 0;
//----------@----------@----------@----------@----------@----------@----------  
//----------@----------@----------@----------@----------@----------@----------  
boolean buttonFunctions(button b){
  String name = b.getName();
  
  if(name.equals("Play")){
    lvlLock = lvl;
    activatePage(play1); 
    setgBIA();
    setupLevel();
    return true;
  }
  if(name.equals("Levels") || name.equals("backToLevelsWB")){
    activatePage(levelsP);
    return true;
  }
  if(name.equals("Controls")){
    activatePage(controls);  
    return true;
  }
  if(name.equals("escToMainScreen")){
    activatePage(main);
    return true;
  }
  if((b.getButtonTag() == 1&&name.equals("tempLevels")) || (name.equals("tempLevels")&&levelStars[b.getButtonTag()-2]>0)){
    lvl = b.getButtonTag();
    lvlLock = lvl;
    activatePage(play1);
    setgBIA();
    setupLevel();
    return true;
  }
  if((name.equals("tempLevelsEdit")&&levelStars[b.getButtonTag()-1]>0) ){
    lvl = b.getButtonTag();
    lvlLock = lvl;
    activatePage(editLevel);
    setupLevel();
    //--2
    return true;
  }
  if(name.equals("PlayB")){
    activatePage(play2);
    customCycle = true;
    waitedOnce = false;
    setupCustomAnimate = true;
    return true;
  }
  if(name.equals("NextWB") && won>0){
    lvlLock = lvl;
    lvl = lvlLock+1;
    activatePage(play1);
    setgBIA();
    setupLevel();
    return true;
  }
  if(name.equals("Pause")){
    music.pause();
    activatePage(pause);
    return true;
  }
  if(name.equals("toggleSound")){
    b.setIsSelected(true);
    music.pause();
    return true;
  }
  if(name.equals("Continue")){
    activatePage(play2); 
    customCycle = true;
    waitedOnce = false;
    pressedContinue = true;
    return true;
  }
  if(name.equals("Restart")){
    clearLvlData();
    activatePage(play2); 
    return true;
  }
  if(name.equals("RestartWB")){
    clearLvlData();
    activatePage(play2);
    return true;
  }
  if(name.equals("Save & Exit")){
    pressedSave = true;
    activatePage(main); 
    return true;
  }
  if(name.equals("MainScreen")){
    clearLvlData();
    activatePage(main);
    return true;
  }
  
  isBinding = 0;
  if(name.equals("climbB")){
    b.setIsSelected(true);
    isBinding = 1;
    return true;
  }
  if(name.equals("moveLeftB")){
    b.setIsSelected(true);
    isBinding = 2;
    return true;  
  }
  if(name.equals("moveRightB")){
    b.setIsSelected(true);
    isBinding = 3;
    return true;  
  }
  if(name.equals("jumpB")){
    b.setIsSelected(true);
    isBinding = 4;
    return true;  
  }
  if(name.equals("openLevelsEditor")){
    activatePage(levelsEditorP);
    return true;
  }
  if(name.equals("editorShowGrid")){
    b.setIsSelected(true);
    if(editLevel.isActive()){
      drawFrame(editLevel);
    }else{
      drawFrame(lvlTable);  
    }
    return true;
  }
  if(name.equals("editorShowLvlData")){
    editorShowGridB.setIsSelected(false);
    b.setIsSelected(true);
    
    activatePage(lvlTable);
    return true;
  }
  return false;
}


void revertButtonFunctions(button b){
  String name =  b.getName(); 
  if(name.equals("toggleSound")){
    music.play();  
  }
  if(name.equals("editorShowGrid")){
    drawFrame(editLevel);
  }
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
    for(int i = 1; i<=levelStars[b.getButtonTag()-1]; i++){
      defaultRect(255,234,0,0);
      rect(b.getX()-5+20*i,b.getY()+(b.getH()*.70), 10,10);
    }
    if(b.getButtonTag() != 1 && levelStars[b.getButtonTag()-2]==0){
      fill(0,120);
      rect(b.getX(),b.getY(),b.getW(),b.getH());
    }
  }
  if(name.equals("tempLevelsEdit")){
    defaultText(0,0,25);
    text("lvl." + b.getButtonTag(),b.getX()+b.getW()/2-(textWidth("lvl"+b.getButtonTag()))/2,b.getY()+(b.getH()*.50) ); 
    for(int i = 1; i<=levelStars[b.getButtonTag()-1]; i++){
      defaultRect(255,234,0,0);
      rect(b.getX()-5+20*i,b.getY()+(b.getH()*.70), 10,10);
    }
    if(levelStars[b.getButtonTag()-1]==0){
      fill(0,120);
      rect(b.getX(),b.getY(),b.getW(),b.getH());
    }
  }
  if(name.equals("openLevelsEditor")){
    //--2;
    defaultText(255,255,15);
    text("Edit Levels",b.getX()+b.getW()/2-(textWidth("Edit Levels"))/2,b.getY()+(b.getH()*.75) );
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
  //-- toggleSound
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
      if(won == 0){
      fill(0,120);
      rect(b.getX(),b.getY(),b.getW(),b.getH());
    }
  }
  if(name.equals("RestartWB")){
    image(restart,b.getX(),b.getY()+2);
    defaultRect(-1,0);
    rect(b.getX(),b.getY(),b.getW(),b.getH());
  }
  
  //--2 Need to Reposition-
  
  if(name.equals("climbB")){
    defaultText(0,0,10);
    text("Click, then press any key to set keybind",b.getX()+2,b.getY()-4);
    defaultText(0,0,20);
    text("Climb",b.getX()+5,b.getY()+b.getH()*.73);
    text("  '" + climb + "'", b.getX()+5 + textWidth("Climb "),b.getY()+b.getH()*.73);
    defaultText(0,0,30);
    text("|", b.getX()+65,b.getY()+b.getH()*.78);
  }
  if(name.equals("moveLeftB")){
    defaultText(0,0,10);
    text("Click, then press any key to set keybind",b.getX()+2,b.getY()-4);
    defaultText(0,0,20);
    text("Left",b.getX()+5,b.getY()+b.getH()*.73);
    text("  '" + left + "'", b.getX()+5 + textWidth("Climb "),b.getY()+b.getH()*.73);
    defaultText(0,0,30);
    text("|", b.getX()+65,b.getY()+b.getH()*.78);
  }
  if(name.equals("moveRightB")){
    defaultText(0,0,10);
    text("Click, then press any key to set keybind",b.getX()+2,b.getY()-4);
    defaultText(0,0,20);
    text("Right",b.getX()+5,b.getY()+b.getH()*.73);
    text("  '" + right + "'", b.getX()+5 + textWidth("Climb "),b.getY()+b.getH()*.73);
    defaultText(0,0,30);
    text("|", b.getX()+65,b.getY()+b.getH()*.78);
  }
  if(name.equals("jumpB")){
    defaultText(0,0,10);
    text("Click, then press any key to set keybind",b.getX()+2,b.getY()-4);
    defaultText(0,0,20);
    text("Jump",b.getX()+5,b.getY()+b.getH()*.73);
    text("  '" + jump + "'", b.getX()+5 + textWidth("Climb "),b.getY()+b.getH()*.73);
    defaultText(0,0,30);
    text("|", b.getX()+65,b.getY()+b.getH()*.78);
  }
  
  if(name.equals("editorShowGrid")){
    for(int y = 0; y<4; y++){
      line(b.getX(),b.getY()+(6*y),b.getX()+b.getW(),b.getY()+(6*y));
    }
    for(int x = 0; x<4; x++){
      line(b.getX()+(6*x),b.getY(),b.getX()+(6*x),b.getY()+b.getH());
    }
  }
  
  if(name.equals("escToMainScreen")){
    image(home,b.getX()+1,b.getY()+1);
  }
  if(name.equals("toggleSound") && b.isSelected()){
    image(soundOff,b.getX()+1,b.getY()+1);
  }else if(name.equals("toggleSound")){
    image(soundOn,b.getX()+1,b.getY()+1);
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

//resetting dating when restart or saves donot occur:
void clearLvlData(){
  introPushCycle = true;
  introPushCycleFrame = 0;
  introPushed = false;
  startedLevel = false;
  startOnce = false;
  
  plannedIndex0 = 0;
  waitedOnce = false;
  pressedContinue = false;
  pressedSave = false;
  resetBinaryBlocks();
  introPushed = false;
}
