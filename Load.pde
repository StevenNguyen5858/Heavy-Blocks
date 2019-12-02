PImage restart;
import processing.sound.*;
SoundFile music;
void setupImages(){
 restart = loadImage("restart.png");
 music = new SoundFile(this, "Tetris'D.mp3");
}
void drawLoadScreen(){
  background(150);
  basicCorners(0);
}
