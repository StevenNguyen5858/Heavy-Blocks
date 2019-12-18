PImage restart;
PImage home;
PImage soundOff;
PImage soundOn;
import processing.sound.*;


PImage contactL;
PImage downL;
PImage passingL;
PImage upL;
PImage rest;
PImage contact;
PImage up;
PImage passing;
PImage down;
PImage[] walkAnimation = {contactL,upL,passingL,downL,rest,contact,down,passing,up,contact};
PImage tempWalk;
int[] translate = {-5,-4,-3,-2,-1,0,1,2,3,4,5};
SoundFile music;
void setupImages(){
 restart = loadImage("restart.png");
 home = loadImage("home.png");
 home.resize(22,22);
 soundOff = loadImage("SoundOff.png");
 soundOn = loadImage("soundOn.png");
 
 music = new SoundFile(this, "Tetris'D.mp3");
 
 upL = loadImage("upL.png");
 passingL = loadImage("passingL.png");
 downL = loadImage("downL.png");
 contactL = loadImage("contactL.png");
 rest = loadImage("rest.png");
 contact = loadImage("contact.png");
 down = loadImage("down.png");
 passing = loadImage("passing.png");
 up = loadImage("up.png");
 
 tempWalk = rest;
 upL.resize(25,50);
 passingL.resize(25,50);
 downL.resize(25,50);
 contactL.resize(25,50);
 rest.resize(25,50);
 contact.resize(25,50);
 down.resize(25,50);
 passing.resize(25,50);
 up.resize(25,50);
 
}
void drawLoadScreen(){
  background(150);
  basicCorners(0);
}
