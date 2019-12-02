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
  if(hasControl0 && play2.isActive()){
    controls();
  }
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
  
}
void keyReleased(){
  player1ControlsR();
}
