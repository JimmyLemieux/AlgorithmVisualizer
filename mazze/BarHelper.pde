class BarHelper extends Thread {

  Bar bars[];
  public BarHelper(Bar bars[]) { 
    this.bars = bars;
  }

  public void test() {
    while (true) {
      for (int i =0, k = bars.length - 1; i<bars.length && k>=0; i++, k--) {
        bars[i].setCurrent();
        bars[k].setCurrent();
        testSwap(i, k);
        delay(500);
        bars[i].setCurrent();
        bars[k].setCurrent();
      }
    }
  }
  
  public Bar[] barState() {
     return this.bars;
  }

  public void testSwap(int a, int b) {
    Bar b1 = bars[a];
    Bar b2 = bars[b];

    
  }

  public void run() {
    test();
  }
}
