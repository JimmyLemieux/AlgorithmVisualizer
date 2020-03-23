import java.util.*;

class ArrayUtil extends Thread {


  ArrayList<Bar> bars;

  public ArrayUtil(ArrayList <Bar> bars) {
    this.bars = bars;
  }
  
  public void run() {
     Collections.shuffle(bars); 
  }
}
