ArrayList<button> mainScreenButtons = new ArrayList<button>();
ArrayList<button> levelsScreenButtons = new ArrayList<button>();
  ArrayList<button> lSBRating = new ArrayList<button>();
ArrayList<button> play1ScreenButtons = new ArrayList<button>();
ArrayList<button> play2ScreenButtons = new ArrayList<button>();
ArrayList<button> pauseScreenButtons = new ArrayList<button>();
ArrayList<button> winScreenButtons = new ArrayList<button>();
ArrayList<button> levelsEditorScreenButtons = new ArrayList<button>();
button openPlayB = new button();
button openLevelsB = new button();
  button tempB = new button();
button openControlsB = new button();
button openSettingsB = new button();

button playB = new button();
button pauseB = new button();
button toggleSoundB = new button();
button continueB = new button();
button restartB = new button();
button saveProgressB = new button();
button mainScreenB = new button();

button exitToMainScreenB = new button();
button openLevelsEditorB = new button();

button backToLevelsWB = new button();
button restartWB = new button();
button playNextWB = new button();
//----------@----------@----------@----------@----------@----------@----------  
void setupButtons(){
  openPlayB = new button(120,120,120,0,"Play",sW/2-100,80,200,35);
  openLevelsB= new button(120,120,120,0,"Levels",sW/2-100,120,200,35);
  openControlsB = new button(120,120,120,0,"Controls",sW/2-100,160,200,35);
  openSettingsB = new button(120,120,120,0,"Settings",sW/2-100,200,200,35);
  
  playB = new button(120,120,120,0,"PlayB",sW/2-50,sH/2-40,100,60);
  pauseB = new button(180,180,180,0,"Pause",60,10,24,24);
  toggleSoundB = new button(180,180,180,0,"toggleSound",90,10,24,24);
  continueB = new button(120,120,120,0,"Continue",sW/2-100,80,200,35);
  restartB = new button(120,120,120,0,"Restart",sW/2-100,120,200,35);
  saveProgressB = new button(120,120,120,0,"Save & Exit",sW/2-100,160,200,35);
  mainScreenB = new button(120,120,120,0,"MainScreen",sW/2-100,200,200,35);
  
  exitToMainScreenB = new button(120,120,120,0,"escToMainScreen",60,10,24,24);
  openLevelsEditorB = new button(180,180,180,0,"openLevelsEditor",sW-145,10,85,23);
  
  backToLevelsWB = new button(120,120,120,0,"backToLevelsWB",sW/2-90,270,40,40);
  restartWB = new button(120,120,120,0,"RestartWB",sW/2-20,270,40,40);
  playNextWB = new button(120,120,120,0,"NextWB",sW/2+50,270,40,40);
  
  mainScreenButtons.add(openPlayB);
  mainScreenButtons.add(openLevelsB);
  mainScreenButtons.add(openControlsB);
  mainScreenButtons.add(openSettingsB);
  
  levelsScreenButtons.add(exitToMainScreenB);
  levelsScreenButtons.add(openLevelsEditorB);
//levelsScreenButtons.add(tempForLoopButtons);
  
  play1ScreenButtons.add(exitToMainScreenB);
  play1ScreenButtons.add(playB);
  
  play2ScreenButtons.add(pauseB);
  play2ScreenButtons.add(toggleSoundB);
  
  pauseScreenButtons.add(continueB);
  pauseScreenButtons.add(restartB);
  pauseScreenButtons.add(saveProgressB);
  pauseScreenButtons.add(mainScreenB);
  
  winScreenButtons.add(backToLevelsWB);
  winScreenButtons.add(restartWB);
  winScreenButtons.add(playNextWB);
}
//----------@----------@----------@----------@----------@----------@----------  
//----------@----------@----------@----------@----------@----------@----------  
public class button{
  //Default button variables:
  private int red = 0;
  private int green = 0;
  private int blue = 0;
  private int stroke = 0;
  private String name = "defaultButtonName";
  private int nameColor = 0;
  private float x = 0.00; 
  private float y = 0.00;
  private float w = 0.00;  
  private float h = 0.00;
  private boolean isSelected = false;
  private boolean willDisplayName = false;
  private int buttonTag = 0;
  //Default constructor
  button(){
  }
  //Button constructor:
  button(int red, int green, int blue, int stroke, String name, float x, float y, float w, float h){
    this.red = red;
    this.green = green;
    this.blue = blue;
    this.name = name;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.stroke = stroke;
  }
  //Constructor for selecting method (is under button class)
  button(float x, float y, float w, float h){
    this.x = x;
    this.w = w;
    this.y = y;
    this.h = h;
  }
  //Default button getters/setters:
  public int getRed(){
     return red;
  }
  public int getGreen(){
     return green;
  }
  public int getBlue(){
     return blue;
  }
  public int getStroke(){
     return stroke; 
  }
  public String getName(){
    return name;
  }
  public int getNameColor(){
    return nameColor;
  }
  public float getX(){
   return x; 
  }
   public float getY(){
   return y; 
  }
  public float getW(){
   return w;
  }
  public float getH(){
   return h; 
  }
  
  public boolean isSelected(){
   return isSelected;
  }
  public void setIsSelected(boolean isSelected){
   this.isSelected = isSelected;
  }
  public boolean willDisplayName(){
   return willDisplayName; 
  }
  public void setButtonTag(int buttonTag){
    this.buttonTag = buttonTag;
  }
  public int getButtonTag(){
    return buttonTag;
  }
}
