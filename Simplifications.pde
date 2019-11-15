//sets default fill/color, intended for rects/shapes:
void defaultRect(int fill, int stroke){
  if(fill == -1){
    noFill();
  }else{
    fill(fill);
  }
  if(stroke == -1){
    noStroke();
  }else{
    stroke(stroke);
  }
}
void defaultRect(int red, int green, int blue, int stroke){
  fill(red,green,blue);
  if(stroke == -1){
    noStroke();
  }else{
    stroke(stroke);
  }
}
//----------@----------@----------@----------@----------@----------@----------  
//sets default fill,stroke,textsize etc, intended for text:
void defaultText(int fill, int stroke, int textSize){
  if(fill == -1){
    noFill();
  }else{
    fill(fill);
  }
  if(stroke == -1){
    noStroke();
  }else{
    stroke(stroke);
  }
  textSize(textSize);
}
void defaultText(int red, int green, int blue, int stroke, int textSize){
  fill(red,green,blue);
  if(stroke == -1){
    noStroke();
  }else{
    stroke(stroke);
  }
  textSize(textSize);
}
//----------@----------@----------@----------@----------@----------@----------  
//----------@----------@----------@----------@----------@----------@----------  
int fitTextHeight(float fitHeight){ 
  for(int i = 5; i<40; i++){
    textSize(i);
    if(Math.abs(fitHeight-textWidth("T")-6) < 10){
      return i;
    }
  }
  return 50;
}
//----------@----------@----------@----------@----------@----------@----------  
//----------@----------@----------@----------@----------@----------@----------  
//Draw Basic background to our screens
void basicCorners(int exitHeightFromGround){
  int space = exitHeightFromGround*50+51;
  defaultRect(150,0);
  rect(0,0,sW-1,sH-1);
  defaultRect(120,0);
  //topLeft
  rect(-1,0,49,sH-space-176);
  //bottumLeft
  rect(-1,sH-space-1,49,space);
  //topRight
  rect(sW-50,0,50,sH-space-176);
  //buttumRight
  rect(sW-50,sH-space-1,50,space);
}
//----------@----------@----------@----------@----------@----------@----------  
//----------@----------@----------@----------@----------@----------@----------  
//ToggleSelect/button control:
void toggleSelect(button b){
  if(hitCheck(b) && !b.isSelected()){
    if(b != playNextWB || b == playNextWB && won){
      selectOn(b);
    }
  }else{
    selectOff(b);
  }
}
void selectOn(button b){
  defaultRect(-1,#00B0FF);
  rect(b.getX(),b.getY(),b.getW(),b.getH());
  buttonFunctions(b);
}
void selectOff(button b){
  if(b.isSelected()){
    defaultRect(-1,b.getStroke());
    rect(b.getX(),b.getY(),b.getW(),b.getH());
    b.setIsSelected(false);
    revertButtonFunctions(b);
  }
}  
  
  public boolean hitCheck(button b){
    if(b.getX()<mouseX && mouseX<(b.getX()+b.getW())  &&  b.getY()<mouseY && mouseY<(b.getY()+b.getH())){
      return true;
    }else{
      return false;  
    }
  }
