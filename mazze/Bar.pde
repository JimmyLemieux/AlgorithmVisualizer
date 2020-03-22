class Bar {
    
  int x, y, w, h, freq;
  
  public int indexNumber;

  boolean isCurrent = false;
  


  public Bar(int x, int y, int w, int h, int indexNumber) {
    this.x = x;
    this.y = y;
    this.freq = y;
    this.w = w;
    this.h = h;
    this.indexNumber = indexNumber;
  }

  public void setCurrent() {
    this.isCurrent = !this.isCurrent;
  }

  public void changeXCoor(int x) {
    this.x = x;
  }
  
  public void changeFreq(int x) {
     this.freq = x; 
  }

  public int getX() {
    return this.x;
  }
  
  public int getFreq() {
    return this.freq; 
  }

  public void drawBar() {
    rectMode(CORNER);
    stroke(255);

    if (isCurrent) {
      fill(color(255, 204, 0));
    } else {
      fill(0);
    }
    rect(x, y, w, h);
  }
}
