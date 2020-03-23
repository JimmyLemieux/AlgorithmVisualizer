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

      delay(10);
      bars[i].setCurrent();
      bars[k].setCurrent();
    }

    sweep();
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
    for (int i =bars.length - 1; i>=0; i--) {
      if (i % 2 == 0)
        bars[i].strokeColor = bars[i].strokeColor - 100;
      else
        bars[i].strokeColor = bars[i].strokeColor - 50;

      m.sin.freq(bars[i].getFreq() * 2);
      delay(2);
    }
  }

  public Bar[] barState() {
    return this.bars;
  }


  public void run() {
    test();
  }
}
