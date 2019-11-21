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
 background(150);
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
    animateFallingBlocks();
    
    if(introPushed == false){
      introPush();
    }
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
  player1Controls();
  
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
