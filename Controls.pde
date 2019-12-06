boolean climbK = false;
boolean rightK = false;
boolean leftK = false;
boolean jumpK = false;
char left = 'a';
char right = 'd';
char jump = ' ';
char climb = 'w';
int leftCode;
int rightCode;
int jumpCode;
int climbCode;
boolean animateClimb = false;
boolean animateJump = false;
boolean animateLeft = false;
boolean animateRight = false;
boolean climbRight = false;
int climbFrame = 0;
int isBinding = 0;


//player frame animation:
int playerFrameWalk = 0;
color playerColor = #CF00FF;

void player1Controls(){
  if(key==climb || keyCode == climbCode){
    //A key combo of 'climb' + 'a' or 'd' needs to be used to climb left or right:
    climbK = true;
  }
  if(key==left || keyCode == leftCode){
    leftK = true;
  }
  if(key==right || keyCode == rightCode){
    rightK = true;  
  }
  if(key==jump || keyCode == jumpCode){
    jumpK = true;  
  }
  //climb up2 right1:
  if(climbK && rightK){
    if(canClimbRight() != 4){
      animateClimb = true;
      climbRight = true;
      climbFrame = canClimbRight();
    }
  }
  //climb up2 left1:
  else if(climbK && leftK){
    if(canClimbLeft() != 4){
      animateClimb = true;
      climbRight = false;
      climbFrame = canClimbLeft();
    }
  }else{
    //move left:
    if((key == left || keyCode == leftCode) && blockCanMove(player1.getX()-1,player1.getY(),player1.getShape(),true)){
      player1.setX(player1.getX()-1);
    }
    //move right:
    if((key == right || keyCode == rightCode ) && blockCanMove(player1.getX()+1,player1.getY(),player1.getShape(),true)){
      player1.setX(player1.getX()+1);
    }
    //jump:
     if((key == jump || keyCode == jumpCode) && blockCanMove(player1.getX(),player1.getY()-1,player1.getShape(),true) &&
     blockCanMove(player1.getX(),player1.getY()+1,player1.getShape(),true) == false){
      player1.setY(player1.getY()-1);
    }
  }
}
void player1ControlsR(){
  if(key == climb || keyCode == climbCode){
    climbK = false;
  }
  if(key == left || keyCode == leftCode){
    leftK = false;
  }
  if(key == right || keyCode == rightCode){
    rightK = false;  
  }
  if(key == jump || keyCode == jumpCode){
    jumpK = false;  
  }
}

void movePlayerHorizontal(){
  if(playerFrameWalk == 4 || playerFrameWalk == -4){
    playerColor = #FF0B03;
  }
  if(playerFrameWalk == -3){
    playerColor = #FF8E03;
  }
  if(playerFrameWalk == -2){
    playerColor = #FFF703;
  }
  if(playerFrameWalk == -1){
    playerColor = #FF8E03;
  }
  if(playerFrameWalk == 0){
    playerColor = #FF0B03;
  }
  if(playerFrameWalk == 1){
    playerColor = #FF8E03;
  }
  if(playerFrameWalk == 2){
    playerColor = #FFF703;
  }
  if(playerFrameWalk == 3){
    playerColor = #FF8E03;
  }
 
}





int canClimbRight(){
  if(jumpK && blockCanMove(player1.getX()+1,player1.getY()-3,player1.getShape(),true) && 
  blockCanMove(player1.getX(),player1.getY()-3,player1.getShape(),true) &&
  blockCanMove(player1.getX(),player1.getY()-2,player1.getShape(),true) &&
  blockCanMove(player1.getX(),player1.getY()-1,player1.getShape(),true) &&
  blockCanMove(player1.getX(),player1.getY()+1,player1.getShape(),true) == false){
    return 0;
  }
  if(blockCanMove(player1.getX(),player1.getY()-2,player1.getShape(),true) && 
  blockCanMove(player1.getX()+1,player1.getY()-2,player1.getShape(),true) &&
  blockCanMove(player1.getX()+1,player1.getY()-1,player1.getShape(),true) == false){
    return 1;
  }
  if(blockCanMove(player1.getX(),player1.getY()-1,player1.getShape(),true) && 
  blockCanMove(player1.getX()+1,player1.getY()-1,player1.getShape(),true) &&
  blockCanMove(player1.getX()+1,player1.getY(),player1.getShape(),true) == false){
     return 2;
  }
  return 4;
}
int canClimbLeft(){
  if(jumpK && blockCanMove(player1.getX()-1,player1.getY()-3,player1.getShape(),true) && 
    blockCanMove(player1.getX(),player1.getY()-3,player1.getShape(),true) &&
    blockCanMove(player1.getX(),player1.getY()-2,player1.getShape(),true) &&
    blockCanMove(player1.getX(),player1.getY()-1,player1.getShape(),true) &&
    blockCanMove(player1.getX(),player1.getY()+1,player1.getShape(),true) == false){
    return 0;
  }
  if(blockCanMove(player1.getX(),player1.getY()-2,player1.getShape(),true) && 
  blockCanMove(player1.getX()-1,player1.getY()-2,player1.getShape(),true) && 
  blockCanMove(player1.getX()-1,player1.getY()-1,player1.getShape(),true) == false){ 
    return 1;
  }
    if(blockCanMove(player1.getX(),player1.getY()-1,player1.getShape(),true) && 
  blockCanMove(player1.getX()-1,player1.getY()-1,player1.getShape(),true) &&
  blockCanMove(player1.getX()-1,player1.getY(),player1.getShape(),true) == false){
     return 2;
  }
  return 4;  
}
void climbFrame(int f){
 if(f == 0){
   player1.setY(player1.getY()-1);
 }
 if(f == 1){
   player1.setY(player1.getY()-1);
 }
 if(f == 2){
   player1.setY(player1.getY()-1);
 }
 if(f == 3){
    if(climbRight){
      player1.setX(player1.getX()+1);
    }else{
      player1.setX(player1.getX()-1);
    }
   animateClimb = false;
 }
}

void developerCommands(){
  
  if(key == BACKSPACE){
    developerCommand = developerCommand.substring(0,developerCommand.length()-1);
  }else if(key == ENTER){
    if(developerCommand.equals("/activatepagemain")){
      activatePage(main);
    }
    if(developerCommand.equals("/activatepageendp")){
      activatePage(endP);
    }
    if(developerCommand.equals("/activatepageplay2")){
      activatePage(play2);
    }
  }else{
    developerCommand = developerCommand + key;
  }
  System.out.println(developerCommand);
  
}
