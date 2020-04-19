import java.util.*;
class BarHelper extends Thread {


  Bar bars[];
  int swaps = 0;
  public BarHelper(Bar bars[]) { 
    this.bars = bars;
  }

  public Bar [] barState() {
    return this.bars;
  }

  public void sweep() {
    while (true) {
      for (int i =0, k = bars.length - 1; i<bars.length / 2 && k>=bars.length / 2; i++, k--) {
        bars[i].setCurrent();
        bars[k].setCurrent();
        this.swap(bars[i], bars[k]);
      }
    }
  }

  public void shuffleBars() {
    for (int i = bars.length - 1; i>=0; i--) {
      int r = (int) random(0, i);
      swap(bars[r], bars[i]);
    }
  }

  public void selectionSort() {
    println(bars[0].getIndex());
    for (int i =0; i<bars.length-1; i++) {
      int indexValue = bars[i].getIndex();
      int index = i;
      for (int j = i+1; j<bars.length; j++) {
        if (bars[j].getIndex() < indexValue) {
          indexValue = bars[j].getIndex(); 
          index = j;
        }
      }
      delay(50);
      this.swap(bars[i], bars[index]);
    }
  }

  public void bubbleSort() {
    for (int i =0; i<bars.length; i++) {
      for (int j = 0; j<bars.length -i-1; j++) {
        if (bars[j].getIndex() > bars[j+1].getIndex()) {
          swap(bars[j], bars[j+1]);
        }
      }
    }
  }
  
  public void insertionSort() {
      
  }

  public void swap(Bar a, Bar b) {
    Bar as = a;
    Bar bs = b;
    Bar temp = new Bar(as);


    as.changeXCoor(bs.getX());
    delay(50 );
    bs.changeXCoor(temp.getX());

    as.changeIndex(bs.getIndex());
    bs.changeIndex(temp.getIndex());
    swaps += 2;
  }


  public void run() {
    bubbleSort();
  }
}
