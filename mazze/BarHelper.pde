class BarHelper extends Thread {

  Bar bars[];
  public BarHelper(Bar bars[]) { 
    this.bars = bars;
  }

  public void test() {
    for (int i =0, k = bars.length - 1; i < bars.length / 2; i++, k--) {
      bars[i].setCurrent();
      bars[k].setCurrent();
      swapBars(bars[i], bars[k]);

      delay(10);
      bars[i].setCurrent();
      bars[k].setCurrent();
    }
  }

  public void swapBars(Bar a, Bar b) {
    int temp = a.getX();
    a.changeXCoor(b.getX());
    b.changeXCoor(temp);
  }

  public Bar[] barState() {
    return this.bars;
  }


  public void run() {
    test();
  }
}
