import java.util.*;
class BarHelper extends Thread {
  Bar bars[];
  SinOsc sin;
  Delay delay;
  int swaps = 0;
  int algo = 1;

  public BarHelper(Bar bars[], SinOsc sin, int algo) { 
    this.sin = sin;
    this.bars = bars;
    this.algo = algo;
  }

  public Bar [] barState() {
    return this.bars;
  }
  
  public void changeAlgorithm(int x) {
     if (x >= 1 && x <=5 ) {
       this.algo = x;
       return;
     }
     this.algo = 1;
     return;
  }

  public void sweep() {
    for (int i =bars.length - 1; i>=0; i--) {
      bars[i].setCurrent();
      sin.freq(bars[bars.length - 1 - i].getFreq() * 2);
      delay(1);
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
    for (int i = 1; i<bars.length; i++) {
      int j = i - 1;
      int keyValue = bars[i].getIndex();
      while (j >= 0 && bars[j].getIndex() > keyValue) {
        swap(bars[j+1], bars[j]);
        j--;
      }
      //swap(bars[j+1], bars[i]);
    }
  }

  public void merge(Bar[] bars, int l, int m, int r) {
    int n1 = m-l+1;
    int n2 = r-m;

    Bar[] L = new Bar[n1];
    Bar[] R = new Bar[n2];

    for (int i =0; i<n1; i++) {
      L[i] = new Bar(bars[l+i]);
    }

    for (int j =0; j<n2; j++) {
      R[j] = new Bar(bars[m + 1 + j]);
    }

    int i = 0, j = 0;
    int k = l;

    while (i < n1 && j < n2) {
      if (L[i].getIndex() < R[j].getIndex()) {
        swap(bars[k], L[i]);
        i++;
      } else {
        swap(bars[k], R[j]);
        j++;
      }
      k++;
    }

    while (i < n1) {
      swap(bars[k], L[i]);
      i++;
      k++;
    }

    while (j < n2) {
      swap(bars[k], R[j]);
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

  int partition(Bar[] bars, int low, int high) {
    int pivot = bars[high].getIndex();

    int i = low - 1;

    for (int j = low; j<=high - 1; j++) {
      if (bars[j].getIndex() < pivot) {
        i++;
        swap(bars[j], bars[i]);
      }
    }
    swap(bars[i+1], bars[high]);
    return pivot;
  }

  public void quickSort(Bar[] bars, int low, int high) {
    if (low < high) {
      int part = partition(bars, 0, high);
      quickSort(bars, low, part - 1);
      quickSort(bars, part+1, high);
    }
  }

  public void timSort() {
  }

  public void bogoSort() {
  }

  public void gravitySort() {
  }

  public void StalinSort() {
  }

  public void otherSwap(Bar a, Bar b) {
    // b goes into a
    a.changeXCoor(b.getX());
    a.changeYCoor(b.getY());
    a.changeFreq(b.getFreq());
    a.changeIndex(b.getIndex());
  }

  public void swap(Bar a, Bar b) {
    Bar as = a;
    Bar bs = b;
    Bar temp = new Bar(as);


    as.setCurrent();
    bs.setCurrent();
    sin.freq(as.getY() * 2);
    sin.freq(bs.getY() * 2);
    delay(1);
    as.setCurrent();
    bs.setCurrent();


    as.changeXCoor(bs.getX());
    bs.changeXCoor(temp.getX());
    as.changeIndex(bs.getIndex());
    bs.changeIndex(temp.getIndex());

    swaps += 2;
  }

  public void run() {
    if (this.algo == 1) {
      bubbleSort();
    } else if (this.algo == 2) {
      selectionSort();
    } else if (this.algo == 3) {
      insertionSort();
    } else if (this.algo == 4) {
      mSort(bars, 0, bars.length - 1);
    } else if (this.algo == 5) {
      quickSort(bars, 0, bars.length - 1);
    }
    sweep();

    // To close the thread
    this.interrupt();
  }
}
