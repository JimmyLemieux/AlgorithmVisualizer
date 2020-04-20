class Bar {

  float x, y, w, h;
  int value, freq, strokeColor = 255;
  boolean isCurrent = false;

  public Bar(float x, float y, float w, int h, int value) {
    this.x = x;
    this.y = y;
    this.freq = (int)y;
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

  public void changeXCoor(float x) {
    this.x = x;
  }

  public void changeYCoor(float y) {
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

  public float getX() {
    return this.x;
  }

  public float getY() {
    return this.y;
  }

  public float getWidth() {
    return this.w;
  }

  public float getHeight() {
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
