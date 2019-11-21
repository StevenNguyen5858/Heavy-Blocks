ArrayList<page> pages = new ArrayList<page>();
page main = new page();
page levelsP = new page();
page play1 = new page();
page play2 = new page();
page pause = new page();
page endP = new page();
page levelsEditorP = new page();
void setupPages(){
  main = new page(mainScreenButtons,true,false,"main");
  levelsP = new page(levelsScreenButtons,false,false,"levels");
  play1 = new page(play1ScreenButtons,false,false,"play1");
  play2 = new page(play2ScreenButtons,false,false,"play2");
  pause = new page(pauseScreenButtons,false,false,"pause"); 
  endP = new page(winScreenButtons,false,false,"endP");
  levelsEditorP = new page(levelsEditorScreenButtons,false,false,"levelsEditor");
  pages.add(main);
  pages.add(levelsP);
  pages.add(play1);
  pages.add(play2);
  pages.add(pause);
  pages.add(endP);
  pages.add(levelsEditorP);
}
public class page{
  private ArrayList<button> pageButtons = new ArrayList<button>();
  private boolean willDrawScreen = false;
  private boolean isActive = false;
  private String specialFunctTag = ".pg";
  page(){
  }
  page(ArrayList<button> pageButtons,boolean willDrawScreen, boolean isActive, String specialFunctTag){
    this.pageButtons = pageButtons;
    this.willDrawScreen = willDrawScreen;
    this.isActive = isActive;
    this.specialFunctTag = specialFunctTag + this.specialFunctTag;
  }
  
  ArrayList<button> getPageButtons(){
    return pageButtons; 
  }
  boolean willDrawScreen(){
    return willDrawScreen;
  }
  boolean isActive(){
    return isActive; 
  }
  String specialFunctTag(){
    return specialFunctTag;
  }
  void setWillDrawScreen(boolean willDrawScreen){
    this.willDrawScreen = willDrawScreen; 
  }
  void setIsActive(boolean isActive){
    this.isActive = isActive;
  }
}
