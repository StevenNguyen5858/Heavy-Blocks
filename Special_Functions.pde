boolean waitedOnce = false;
boolean pressedContinue = false;
boolean pressedSave = false;
boolean setupCustomAnimate = false;
//----------@----------@----------@----------@----------@----------@----------  
//----------@----------@----------@----------@----------@----------@----------  
void buttonFunctions(button b){
  String name = b.getName();
  
  if(name.equals("Levels")){
    activatePage(levels); 
  }
  if(name.equals("Play")){
    activatePage(play1); 
    setgBIA();
  }
  if(name.equals("escToMainScreen")){
    activatePage(main);
  }
  if(name.equals("tempLevels")){
    lvl = b.getButtonTag();
    activatePage(play1);
    setgBIA();
  }
  if(name.equals("PlayB")){
    activatePage(play2);
    customCycle = true;
    waitedOnce = false;
    setupCustomAnimate = true;
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
    plannedIndex[lvl-1] = 0;
    waitedOnce = false;
    pressedContinue = false;
    pressedSave = false;
    resetBinaryBlocks();
    activatePage(play2);  
  }
  if(name.equals("Save & Exit")){
    pressedSave = true;
    activatePage(main); 
  }
  if(name.equals("MainScreen")){
    plannedIndex[lvl-1] = 0;
    waitedOnce = false;
    pressedContinue = false;
    pressedSave = false;
    resetBinaryBlocks();
    activatePage(main);  
  }
  
}
void activatePage(page p){
  //deactivates other pages:
  for(int i = 0; i<pages.size(); i++){
    if(pages.get(i) != p){
      pages.get(i).setIsActive(false);  
    }
  }
  //Activates page:
  p.setWillDrawScreen(true);
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
    System.out.println("------------------" + i);
    System.out.println(gameBlockIsActive.get(lvl-1)[i]);
    gameBlocks.get(i).setIsActive(gameBlockIsActive.get(lvl-1)[i]);
    System.out.println(gameBlocks.get(i).isActive());
  }
}
