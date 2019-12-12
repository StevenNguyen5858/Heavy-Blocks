button temp = new button();
button tempEdit = new button();
void activatePage(page p){
  if(p != main){
    typingCommands = false;  
  }
  //deactivates other pages:
  for(int i = 0; i<pages.size(); i++){
    if(pages.get(i) != p){
      pages.get(i).setIsActive(false);  
    }
  }
  //Activates page:
  p.setWillDrawScreen(true);
}

void drawFrame(page p){
  if(p == play2 && !toggleSoundB.isSelected()){
    //music.play(); 
    music.loop();
  }
  screenLayout(p);
  drawPageButtons(p);
  
  p.setIsActive(true);
  p.setWillDrawScreen(false);
}
void screenLayout(page p){
 String name = p.specialFunctTag();
 //MainScreen page
 if(name.equals("main.pg")){
   basicCorners(2);
   
   defaultText(0,0,30);
   text("Heavy Blocks",sW/2-(textWidth("Heavy Blocks")/2),50);
   defaultRect(120,0);
   rect(sW/2-120,60,240,270);
 }
 if(name.equals("controls.pg")){
   basicCorners(2);
   
   defaultText(0,0,30);
   text("Controls:",sW/2-(textWidth("Controls")/2),50);
   defaultRect(120,0);
   rect(sW/2-120,60,240,270);
 }
 
 //LevelsScreen page
 if(name.equals("levels.pg")){
   basicCorners(2);
   
   defaultText(0,0,30);
   text("Levels",sW/2-(textWidth("Levels")/2),50);
 }
 //levelsEditorScreen
 if(name.equals("levelsEditor.pg")){
   basicCorners(2);
   
   defaultText(0,0,30);
   text("Levels Editor",sW/2-(textWidth("Levels Editor")/2),50);
 }
 if(name.equals("editLevel.pg")){
   basicCorners(lvl);
   
   defaultText(0,0,30);
   text("Editing lvl " + lvl,sW/2-(textWidth("Editing lvl ")/2),60); 
 }
 
 //PlayScreen pages
 if(name.equals("play1.pg")){
   basicCorners(lvl);
   
   defaultText(0,0,30);
   text("Level " + lvl,sW/2-(textWidth("Levels")/2),50); 
 }
 if(name.equals("play2.pg")){
   basicCorners(lvl);
   
   int space = (lvl+startH[lvl-1])*(50) + 51;
   defaultRect(120,0);
   if(introPushed){
     defaultRect(120,0);
     rect(-1,0,49,sH-1);
   }else if(introPushCycleFrame == 3){
     rect(-1,space+4,49,171);
   }else{
     rect(-1,space+4,introPushCycleFrame*25-1,171);
   }
   
   defaultText(0,0,30);
   text("Level " + lvl,sW/2-(textWidth("Levels")/2),50);  
 }
 if(name.equals("pause.pg")){
   fill(0,100);
   noStroke();
   rect(0,0,sW,sH);
   
   defaultText(0,0,30);
   text("Level " + lvl,sW/2-(textWidth("Levels")/2),50);  
 }
 if(name.equals("endP.pg")){
   String endPText = "";
   if(won>0){
     endPText = "Congrats!";
   }else{
     endPText = ".-. Wack! Try 'gain";
   }
   basicCorners(lvl);
   
   defaultText(0,0,30);
   text(endPText,sW/2-(textWidth(endPText)/2),50); 
   defaultRect(120,0);
   rect(sW/2-120,80,240,250);
   drawStars(won);
   
   clearLvlData();
   music.stop();
 }
}
void drawPageButtons(page p){
  String name = p.specialFunctTag();
  if(name.equals("levels.pg")){
    for(int y = 1; y<=3; y++){
      for(int x = 1; x<=3; x++){
        tempB = new button(210,210,210,0,"tempLevels",55+100*x,100*y-20,80,80);
        tempB.setButtonTag(3*(y-1)+x);
        drawButton(tempB);
      }
    }
  }
  if(name.equals("levelsEditor.pg")){
    for(int y = 1; y<=3; y++){
      for(int x = 1; x<=3; x++){
        tempEditB = new button(210,210,210,0,"tempLevelsEdit",55+100*x,100*y-20,80,80);
        tempEditB.setButtonTag(3*(y-1)+x);
        drawButton(tempEditB);
      }
    }
  }
  
  for(int i = 0; i<p.getPageButtons().size(); i++){
    drawButton(p.getPageButtons().get(i));
  }
}
void hitCheckPage(page p){
  if(p.isActive()){
    String name = p.specialFunctTag();
    if(name.equals("levels.pg")){
      for(int y = 1; y<=3; y++){
        for(int x = 1; x<=3; x++){
          temp = new button(210,210,210,0,"tempLevels",55+100*x,100*y-20,80,80);
          temp.setButtonTag(x+(y-1)*3);
          toggleSelect(temp);
        }
      }
    }
    if(name.equals("levelsEditor.pg")){
      for(int y = 1; y<=3; y++){
        for(int x = 1; x<=3; x++){
          tempEdit = new button(210,210,210,0,"tempLevelsEdit",55+100*x,100*y-20,80,80);
          tempEdit.setButtonTag(x+(y-1)*3);
          toggleSelect(tempEdit);
        }
      }
    }
    for(int i = 0; i<p.getPageButtons().size(); i++){
      button temp = p.getPageButtons().get(i);
      toggleSelect(temp); 
    }
    
  }
}

//--2 drawStars:
void drawStars(int w){
  levelStars[lvl-1] = won;
  for(int i = 0; i<3; i++){
    if(i<w){
      defaultRect(255,234,0,0);
    }else{
      fill(0,120);
      stroke(0);
    }
    rect(sW/2-100+(i*75),115,50,50);
  }
}
