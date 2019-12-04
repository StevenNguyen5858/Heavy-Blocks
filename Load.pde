PImage restart;
PImage home;
import processing.sound.*;
SoundFile music;
void setupImages(){
 restart = loadImage("restart.png");
 home = loadImage("home.png");
 home.resize(22,22);
 music = new SoundFile(this, "Tetris'D.mp3");
}
void drawLoadScreen(){
  background(150);
  basicCorners(0);
}
