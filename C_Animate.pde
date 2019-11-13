//Animate falling blocks:
boolean customCycle = false;
int nowCustom = -1000;
int waitTimeCustom = -1000;
//Animate climb:
boolean climbCycle = false;
int nowClimb = -100;
int waitTimeClimb = -100;
int fNumber = 0;
//Animate player gravity:
boolean playerGravityCycle = true;
int nowPlayerGravity = -500;
int waitTimePlayerGravity = -500;
//Animate player walk:
boolean playerWalkCycle = true;
int nowPlayerWalk = -50;
int waitTimePlayerWalk = -50;


void setupAnimate(){
 
}
//Animation Compiling methods:
void animateFallingBlocks(){
    if(waitedOnce == false && pressedContinue == false && pressedSave == false){
      block.setX(plannedX.get(lvl-1)[plannedIndex[lvl-1]]);
      block.setY(plannedY.get(lvl-1)[plannedIndex[lvl-1]]);  
      player1.setX(plannedPlayerX.get(lvl-1));
      player1.setY(plannedPlayerY.get(lvl-1)); 
      block.setShape(shapes.get(plannedS.get(lvl-1)[plannedIndex[lvl-1]]));
    }
    if(customCycle && waitedOnce==true){
      nowCustom = millis();
      waitTimeCustom = 50;
      customCycle = false;
    }
    screenLayout(play2);
    //grid();---2
    blockBounds();
    playerBounds();
    if(millis() > nowCustom + waitTimeCustom){
      prepDropBlocks();
      customCycle = true;
      waitedOnce = true;
    }
    /*
    for(int i = 0; i<gameBlocks.size();i++){
      if(gameBlocks.get(i).isActive()){
        drawShape(gameBlocks.get(i));  
      }
    }
    */
    //shapes are set values into our drawBinaryBlocksPB therefore drawShape is unecessary
    //drawShape(block);
    drawPlayer(player1);
    
    //drawBinaryBlocks();
    drawBinaryBlocksPB();
    drawPageButtons(play2);
}

void animatePlayerClimbing(){
  if(climbCycle){
    nowClimb = millis();
    waitTimeClimb = 100;
    climbCycle = false;
  }
  if(millis() > nowClimb + waitTimeClimb){
    climbFrame(climbFrame);
    climbCycle = true;
    climbFrame++;
  }
}
void playerGravity(){
  if(playerGravityCycle){
    nowPlayerGravity = millis();
    waitTimePlayerGravity = 450;
    playerGravityCycle = false;
  }
  if(millis() > nowPlayerGravity + waitTimePlayerGravity){
    if(blockCanMove(player1.getX(),player1.getY()+1,player1.getShape(),true)){
      player1.setY(player1.getY()+1);
    }
    playerGravityCycle = true;
  }  
}
void playerWalkLeft(){
  if(playerWalkCycle){
    nowPlayerWalk = millis();
    waitTimePlayerWalk = 50;
    playerWalkCycle = false;
  }
  if(millis() > nowPlayerWalk + waitTimePlayerWalk){
    playerFrameWalk--;
    movePlayerHorizontal();
    if(playerFrameWalk == -4 || playerFrameWalk == 4 || playerFrameWalk == 0){
      player1.setX(player1.getX()-1);
      animateLeft = false;
    }
    playerWalkCycle = true;
  }  
}
//----------@----------@----------@----------@----------@----------@----------  
//----------@----------@----------@----------@----------@----------@----------  
//void animateFallingBlocks mini methods:
void prepDropBlocks(){
  if(blockCanMove(block.getX(),block.getY()+1,block.getShape(),false)){
    for(int y = 0; y<3; y++){
      for(int x = 0; x<3; x++){
        if(block.getShape()[y][x] == 1){
          binaryBlocksPB[block.getX()+x][block.getY()+y] = false;
        }
      }
    }
    block.setY(block.getY()+1);
    for(int y = 0; y<3; y++){
      for(int x = 0; x<3; x++){
        if(block.getShape()[y][x] == 1){
          binaryBlocksPB[block.getX()+x][block.getY()+y] = true;
        }
      }
    }
  }else{
    if(plannedIndex[lvl-1]==plannedX.get(lvl-1).length-1){
      //-winmethod-
      hasControl.set(lvl-1,false);
    }else{
      //new block ish
      plannedIndex[lvl-1]++;
      //add current blocks to a log
      for(int y = 0; y<3; y++){
        for(int x = 0; x<3; x++){
          if(block.getShape()[y][x] == 1){
            binaryBlocks[block.getX()+x][block.getY()+y] = true;
          }
        }
      }
      PBEquals();
      // set new block data to presets
      block.setX(plannedX.get(lvl-1)[plannedIndex[lvl-1]]);
      block.setY(plannedY.get(lvl-1)[plannedIndex[lvl-1]]);
      block.setShape(shapes.get(plannedS.get(lvl-1)[plannedIndex[lvl-1]]));
    }
  }
}
//----------@----------@----------@----------@----------@----------@----------  
void grid(){
  for(int y = 0; y<gridR; y++){
    for(int x = 0; x<gridC; x++){
      defaultRect(-1,0);
      rect(translateGridX+(x*25),translateGridY+(y*25),25,25);
    }
  }
}
//----------@----------@----------@----------@----------@----------@----------  
void blockBounds(){
  for(int x = 0; x<gridC; x++){
    binaryBlocks[x][gridR-1] = true;
  }
  for(int y = 0; y<gridR; y++){  
    binaryBlocks[0][y] = true;
  }
  for(int y = 0; y<gridR; y++){
    binaryBlocks[gridC-1][y] = true;
  }
}
//----------@----------@----------@----------@----------@----------@----------  
void playerBounds(){
  for(int x = 0; x<gridC; x++){
    binaryBlocksPB[x][gridR-1] = true;
  }
  for(int y = 0; y<gridR; y++){
    if(y<=(gridR-(lvl*2+3)-8) || y>=gridR-(lvl*2+3)){
      binaryBlocksPB[0][y] = true;
    }
  }
  for(int y = 0; y<gridR; y++){
    if(y<=(gridR-(lvl*2+3)-8) || y>=gridR-(lvl*2+3)){
      binaryBlocksPB[gridC-1][y] = true;
    }
  }  
}
//----------@----------@----------@----------@----------@----------@----------  
void drawBinaryBlocks(){
  for(int y = 0; y<gridR; y++){
      for(int x = 0; x<gridC; x++){
        if(binaryBlocks[x][y] == true){
          defaultRect(255,255);
          shape tempShape = new shape(shapes.get(4),x,y,true);
          drawShape(tempShape);
        }
      }
  }
}
//----------@----------@----------@----------@----------@----------@----------  
void drawBinaryBlocksPB(){
  //--2 add limit to x starting at int x = 1 to x<gridC-1 to remove side border blocks visually
  //--2 add limit to y at y<gridR-1 to remove bottum visual border blocks visually
  for(int y = 0; y<gridR; y++){
    for(int x = 0; x<gridC; x++){
      if(binaryBlocksPB[x][y] == true){
        defaultRect(255,255);
        shape tempShape = new shape(shapes.get(4),x,y,true);
        drawShape(tempShape);
      }
    }
  }
}
//----------@----------@----------@----------@----------@----------@----------  
void PBEquals(){
  for(int y = 0; y<gridR; y++){
      for(int x = 1; x<gridC-1; x++){
        if(binaryBlocks[x][y] == true){
          binaryBlocksPB[x][y] = true;
        }
      }
  }
}
//----------@----------@----------@----------@----------@----------@---------- 
//----------@----------@----------@----------@----------@----------@---------- 
boolean blockCanMove(int newX, int newY, int[][] s, boolean isPlayer){
  for(int y = 0; y<3; y++){
    for(int x = 0; x<3; x++){ 
      if(isPlayer == false){
        if(s[y][x] == 1 && binaryBlocks[newX+x][newY+y] == true){
          return false;
        }
      }else if((s[y][x] == 1&&(0>newX||newX+x>=22)) || (s[y][x] == 1 && binaryBlocksPB[newX+x][newY+y] == true)){
        return false;
      }
    }
  }  
  return true;
}
//----------@----------@----------@----------@----------@----------@---------- 
void checkCrushed(){
 if(blockCanMove(player1.getX(),player1.getY(),player1.getShape(),true) == false &&
 blockCanMove(player1.getX(),player1.getY()+1,player1.getShape(),true) == false){
   crushed();
 }else if(blockCanMove(player1.getX(),player1.getY(),player1.getShape(),true) == false && 
 blockCanMove(player1.getX(),player1.getY()+1,player1.getShape(),true) == true){
   player1.setY(player1.getY()+1);
 } 
}
void crushed(){
  text("OoOoFf",sW/2-(textWidth("OoOoFf")/2),400);
}
//----------@----------@----------@----------@----------@----------@----------  
//----------@----------@----------@----------@----------@----------@----------  