class BarHelper extends Thread {

  Bar bars[];
  mazze m;
  public BarHelper(Bar bars[], mazze m) { 
    this.bars = bars;
    this.m = m;
  }

  public void test() {
    for (int i =0, k = bars.length - 1; i < bars.length / 2; i++, k--) {
      bars[i].setCurrent();
      bars[k].setCurrent();
      swapBars(bars[i], bars[k]);

      delay(100);
      bars[i].setCurrent();
      bars[k].setCurrent();
    }
    m.sin.stop();
  }

  public void swapBars(Bar a, Bar b) {
    int temp = a.getX();
    int tempFreq = a.getFreq();
    a.changeXCoor(b.getX());
    m.sin.freq(a.getFreq() * 2);
    a.changeFreq(b.freq);
    b.changeXCoor(temp);
    b.changeFreq(tempFreq);
  }

  public void sweep() {
    for (int i =0; i<bars.length; i++) {
    }
  }

  public Bar[] barState() {
    return this.bars;
  }


  public void run() {
    test();
  }
}
