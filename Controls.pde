boolean climbK = false;
boolean rightK = false;
boolean leftK = false;
char left = 'a';
char right = 'd';
char jump = ' ';
char climb = 'w';
boolean animateClimb = false;
boolean animateJump = false;
boolean animateLeft = false;
boolean animateRight = false;
boolean climbRight = false;
int climbFrame = 0;

//player frame animation:
int playerFrameWalk = 0;
color playerColor = #CF00FF;
void controls(){
  if(key == CODED){
    if(keyCode == LEFT && blockCanMove(block.getX()-1,block.getY(),block.getShape(),false)){
      block.setX(block.getX()-1);  
    }
    if(keyCode == RIGHT && blockCanMove(block.getX()+1,block.getY(),block.getShape(),false)){
      block.setX(block.getX()+1);  
    }
  }
}

void player1Controls(){
  //climb up2 right1:
  if(climbK && key == right || key == climb && rightK){
    if(canClimbRight() != 4){
      animateClimb = true;
      climbRight = true;
      climbFrame = canClimbRight();
    }
  }
  //climb up2 left1:
  else if(climbK && key == left || key == climb && leftK){
    if(canClimbLeft() != 4){
      animateClimb = true;
      climbRight = false;
      climbFrame = canClimbLeft();
    }
  }else{
    //move left:
    if(key == left && blockCanMove(player1.getX()-1,player1.getY(),player1.getShape(),true)){
      player1.setX(player1.getX()-1);
    }
    //move right:
    if(key == right && blockCanMove(player1.getX()+1,player1.getY(),player1.getShape(),true)){
      player1.setX(player1.getX()+1);
    }
    //jump:
     if(key == jump && blockCanMove(player1.getX(),player1.getY()-1,player1.getShape(),true) &&
     blockCanMove(player1.getX(),player1.getY()+1,player1.getShape(),true) == false){
      player1.setY(player1.getY()-1);
    }
  }
  if(key==climb){
    //A key combo of 'climb' + 'a' or 'd' needs to be used to climb left or right:
    climbK = true;
  }
  if(key==left){
    leftK = true;
  }
  if(key==right){
    rightK = true;  
  }
}
void player1ControlsR(){
  if(key == climb){
    climbK = false;
  }
  if(key == left){
    leftK = false;
  }
  if(key == right){
    rightK = false;  
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
  System.out.println(playerFrameWalk);
 
}





int canClimbRight(){
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
