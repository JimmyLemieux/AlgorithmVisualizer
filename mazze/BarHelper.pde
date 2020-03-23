import java.util.*;
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

      delay(50);
      bars[i].setCurrent();
      bars[k].setCurrent();
    }

    sweep();
    m.sin.stop();
  }

  public void shuffleBars() {
      randomSeed(millis());  
      for (int i = bars.length - 1; i>0;i--) {
         int j = (int)random(i);
         swapBars(bars[i], bars[j]);
      }
  }
  
  public void selectionSort() {
    int i,j,min;
     for (i =0;i<bars.length - 1;i++) {
          min = bars[i].indexNumber;
          bars[i].setCurrent();
        for (j =i + 1;j<bars.length;j++) {
            bars[j].setCurrent();
            if (bars[j].indexNumber < bars[min].indexNumber ) {
               bars[j].setCurrent();
               min = bars[j].indexNumber;
            }
            bars[j].setCurrent();
        }
        delay(2);
        swapBars(bars[i], bars[min]);
        bars[i].setCurrent();
        //println(min);
     }
     sweep();
     
     m.sin.stop();
     
     println(bars[0].indexNumber);
   
  }

  public void swapBars(Bar a, Bar b) {
    int temp = a.getX();
    int tempFreq = a.getFreq();
    int tempIndex = a.indexNumber;
    
    
    a.changeXCoor(b.getX());
    m.sin.freq(a.getFreq() * 2);
    a.changeFreq(b.freq);
    b.changeXCoor(temp);
    b.changeFreq(tempFreq);
    
    bars[a.indexNumber] = b;
    bars[b.indexNumber] = a;
    

    
    bars[a.indexNumber].indexNumber = b.indexNumber;
    bars[b.indexNumber].indexNumber = tempIndex;
    

    

  }

  public void sweep() {
    for (int i =bars.length  - 1; i>=0; i--) {
      if (i % 2 == 0)
        bars[i].strokeColor = bars[i].strokeColor - 100;
      else
        bars[i].strokeColor = bars[i].strokeColor - 50;

      m.sin.freq(bars[i].getFreq() * 2);
      delay(2);
    }
  }

  public Bar [] barState() {
    return this.bars;
  }


  public void run() {
    //selectionSort();
  }
 
}
