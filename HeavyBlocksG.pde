//https://github.com/StevenNguyen5858/Heavy-Blocks.git
int sW = 0;
int sH = 0;
float screenScale = .6;
void settings(){ 
  sW = (int)(1000*screenScale);
  sH = (int)(800*screenScale);
  size(sW,sH);
}

//Layout/Screen ish is in button functions
void setup(){
 drawLoadScreen();
 setupButtons();
 setupShapes();
 setupPresets();
 setupPages();
 setupAnimate();
 setupLevels();
 setupImages();
}
void draw(){
  //draw page if willDrawScreen:
  for(int i = 0; i<pages.size(); i++){
    page temp = pages.get(i);
    if(temp.willDrawScreen){
      drawFrame(temp);
    }
  }
  //play screen animations:
  if(play2.isActive()){
    if(introPushed == false){
      screenLayout(play2);
      drawBinaryBlocksPB();
      drawPageButtons(play2);
      playerBounds();
      if(startOnce == false && waitedOnce == false && pressedContinue == false && pressedSave == false){
        //prepIntro:
        player1.setX(startX0);
        player1.setY(startY0);
        block.setX(lvlX0[plannedIndex0]);
        block.setY(lvlY0);  
        block.setShape(shapes.get(shapes0[plannedIndex0]));
        startOnce = true;
      }
 
      introPush();
      
      if(introPushCycleFrame == 3){
        playerGravity();
      }
      drawPlayer(player1);
    }
    
    if(startedLevel){
      animateFallingBlocks();
      //Player movement
      if(animateClimb){
        animatePlayerClimbing();
      }
      if(animateClimb==false && animateJump == false){
        playerGravity();
      }
      /*if(animateLeft){
        playerWalkLeft();
      }*/
    }
    
    
  }
}


int now = 0;
void waitT(int waitTime){
  boolean once = true;
  now = millis();
  while(once){
    if(millis() > now + waitTime){
     once = false; 
    }
  }
}

void mousePressed(){
  for(int i = 0; i<pages.size(); i++){
    page temp = pages.get(i);
    hitCheckPage(temp);
  }
}
String developerCommand  = "";
boolean typingCommands = false;
void keyPressed(){
  if(startedLevel){
    player1Controls();
  }
  if(key == '/'){
    
    developerCommand = "";
    typingCommands = true;
    activatePage(main);
  }
  if(typingCommands){
    developerCommands();
  }
  //--2 Currently user can only reassign controls to characters and space, CODED keys will not work (LEFT,RIGHT,etc.)
  if(isBinding>0){
    if(isBinding == 1){
      if(key == CODED){
        climbCode = keyCode;
        climb = '!';
      }else{
        climb = key;
        climbCode = -1;
      }
      selectOff(climbB);
    }
    
    if(isBinding == 2){
      if(key == CODED){
        leftCode = keyCode;
        left = '@';
      }else{
        left = key;
        leftCode = -2;
      }
      selectOff(moveLeftB);
    }
    if(isBinding == 3){
      if(key == CODED){
        rightCode = keyCode;
        right = '#';
      }else{
        right = key;
        rightCode = -3;
      }
      selectOff(moveRightB);
    }
    if(isBinding == 4){
      if(key == CODED){
        jumpCode = LEFT;
        jump = '$';
      }else{
        jump = key;
        jumpCode = -4;
      }
      selectOff(jumpB);
    } 
    isBinding = 0;
    drawFrame(controls);
  }
}
void keyReleased(){
  player1ControlsR();
}
