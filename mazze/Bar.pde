class Bar {

  int x, y, w, h, freq, value, strokeColor = 255;
  boolean isCurrent = false;

  public Bar(int x, int y, int w, int h, int value) {
    this.x = x;
    this.y = y;
    this.freq = y;
    this.w = w;
    this.h = h;
    this.value = value;
  }

  public Bar(Bar b) {
    this.x = b.getX();
    this.y = b.getY();
    this.w = b.getWidth();
    this.h = b.getHeight();
    this.freq = b.getFreq();
    this.value = b.getIndex();
  }



  public void setCurrent() {
    this.isCurrent = !this.isCurrent;
  }

  public void changeXCoor(int x) {
    this.x = x;
  }

  public void changeYCoor(int y) {
    this.y = y;
  }

  public void changeFreq(int x) {
    this.freq = x;
  }

  public void changeIndex(int index) {
    this.value = index;
  }

  public int getIndex() {
    return this.value;
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
      stroke(color(255, 47,0));
      fill(color(255, 204, 0));
    } else {
      fill(0);
    }
    rect(x, y, w, h);
  }
}
