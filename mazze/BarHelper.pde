class BarHelper extends Thread {

  Bar bars[];
  mazze m;
  public BarHelper(Bar bars[], mazze m) { 
    this.bars = bars;
    this.m = m;
  }

  public void test() {
    for (int i =0, k = m.bars.length - 1; i<m.bars.length / 2; i++, k--) {
      m.bars[i].setCurrent();
      m.bars[k].setCurrent();
      testSwap(m.bars[i], m.bars[k]);

      delay(50);
      m.bars[i].setCurrent();
      m.bars[k].setCurrent();
      

    }
    m.redraw();
  }
  
  public void testSwap(Bar a, Bar b) {
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
