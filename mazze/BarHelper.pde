import java.util.*;
class BarHelper extends Thread {


  Bar bars[];
  SinOsc sin;
  int swaps = 0;

  public BarHelper(Bar bars[], SinOsc sin) { 
    this.sin = sin;
    this.bars = bars;
  }

  public Bar [] barState() {
    return this.bars;
  }

  public void sweep() {
    for (int i =bars.length - 1; i>=0; i--) {
      bars[i].setCurrent();
      sin.freq(bars[bars.length - 1 - i].getFreq() * 2);
      delay(5);
    }
    sin.stop();
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
      swap(bars[i], bars[index]);
    }
    sweep();
  }

  public void bubbleSort() {
    for (int i =0; i<bars.length; i++) {
      for (int j = 0; j<bars.length -i-1; j++) {
        if (bars[j].getIndex() > bars[j+1].getIndex()) {
          swap(bars[j], bars[j+1]);
        }
      }
    }
    sweep();
  }

  public void insertionSort() {
    for (int i = 1; i<bars.length; i++) {
      int j = i - 1;
      int keyValue = bars[i].getIndex();
      while (j >= 0 && bars[j].getIndex() > keyValue) {
        swap(bars[j+1], bars[j]);
        j--;
      }
      //swap(bars[j+1], bars[i]);
    }
    sweep();
  }

  public void merge(Bar[] bars, int l, int m, int r) {
    int n1 = m-l+1;
    int n2 = r-m;

    Bar[] L = new Bar[n1];
    Bar[] R = new Bar[n2];

    for (int i =0; i<n1; i++) {
      L[i] = bars[l+i];
    }

    for (int j =0; j<n2; j++) {
      R[j] = bars[m + 1 + j];
    }

    int i = 0, j = 0;
    int k = l;

    while (i < n1 && j < n2) {
      int t = bars[k].getY();
      if (L[i].getIndex() < R[j].getIndex()) {

        bars[k].changeYCoor(L[i].getY());
        bars[k] = L[i];
        L[i].changeYCoor(t);

        i++;
      } else {
        bars[k].changeYCoor(R[j].getY());
        bars[k] = R[j];
        R[j].changeYCoor(t);
        j++;
      }
      k++;
    }

    while (i < n1) {
      int t = bars[k].getY();
      bars[k].changeYCoor(L[i].getY());
      bars[k] = L[i];
      L[i].changeYCoor(t);

      i++;
      k++;
    }

    while (j < n2) {
      int t = bars[k].getY();

      bars[k].changeYCoor(R[j].getY());
      bars[k] = R[j];
      R[j].changeYCoor(t);

      j++;
      k++;
    }
  }

  public void mSort(Bar[] bars, int l, int r) {
    if (l < r) {
      int m = (l + r)/2;
      mSort(bars, l, m);
      mSort(bars, m+1, r);
      merge(bars, l, m, r);
    }
  }

  public void swap(Bar a, Bar b) {
    Bar as = a;
    Bar bs = b;
    Bar temp = new Bar(as);


    as.changeXCoor(bs.getX());
    sin.freq(as.getY() * 2);
    sin.freq(bs.getY() * 2);
    as.setCurrent();
    bs.setCurrent();
    delay(10);
    as.setCurrent();
    bs.setCurrent();
    bs.changeXCoor(temp.getX());

    as.changeIndex(bs.getIndex());
    bs.changeIndex(temp.getIndex());

    swaps += 2;
  }

  public void run() {
    mSort(bars, 0, bars.length - 1);
    println("----------");

    bars[5].setCurrent();
    for (int i =0; i<bars.length; i++) {
      println(bars[i].getIndex());
      println(bars[i].getY());
    }
  }
}
