class Bar {

  int x, y, w, h, freq;



  int strokeColor = 255;

  int indexNumber;

  boolean isCurrent = false;



  public Bar(int x, int y, int w, int h, int indexNumber) {
    this.x = x;
    this.y = y;
    this.freq = y;
    this.w = w;
    this.h = h;
    this.indexNumber = indexNumber;
  }
  
  public Bar(Bar b) {
     this.x = b.getX();
     this.y = b.getY();
     this.w = b.getWidth();
     this.h = b.getHeight();
     this.freq = b.getFreq();
     this.indexNumber = b.getIndex();
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
  
  public void changeIndex(int index) {
     this.indexNumber = index; 
  }

  public int getIndex() {
    return this.indexNumber;
  }

  public int getX() {
    return this.x;
  }
  
  public int getY() {
    return this.y;
  }
  
  public int getWidth() {
    return this.w;
  }
  
  public int getHeight() {
    return this.h;
  }

  public int getFreq() {
    return this.freq;
  }

  public void drawBar() {
    rectMode(CORNER);
    stroke(strokeColor);

    if (isCurrent) {
      fill(color(255, 204, 0));
    } else {
      fill(0);
    }
    rect(x, y, w, h);
  }
}
