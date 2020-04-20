import processing.sound.*;
import java.util.*;
import java.lang.management.ManagementFactory;
import java.lang.management.OperatingSystemMXBean;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
Tile grid[][];
Tile genesisBlock;
GraphHelper gh;
BarHelper bh;
Bar bar;
Bar bars[];
DFS d;
BFS b;
SinOsc sin;
OperatingSystemMXBean osBean;

int c = 200;
boolean start = false;
float squareSize = 1;
float cols, rows;

void setup() {
  size(1000, 1000);
  background(100);
  randomSeed(second());
  frameRate(60);
  cols = width/squareSize;
  rows = height/squareSize;
  //grid = new Tile[(int)rows][cols];


  osBean = ManagementFactory.getPlatformMXBean(OperatingSystemMXBean.class);


  sin = new SinOsc(this);


  bars = new Bar[(int)cols];


  for (int i =0; i<cols; i++) {
    // xPos, yPos, width, height, value
    bars[i] = (new Bar(i * squareSize, i * squareSize, squareSize, height, (int)(cols - i) - 1));
  }



  bh = new BarHelper(bars, sin);

  sin.amp(0.01);
  bh.shuffleBars();
  sin.play();
  bh.start();
}

//void initGrid() {
//  for (int i = 0; i<rows; i++) {
//    for (int j = 0; j<cols; j++) {
//      grid[i][j] = new Tile(i * squareSize, j*squareSize, (int)squareSize);
//    }
//  }
//}

void redoDraw() {
  for (int i =0; i<rows; i++) {
    for (int j =0; j<cols; j++) {
      grid[i][j].display();
    }
  }
}

public void redoDrawBars() {
  for (int i = 0; i<bars.length; i++) {
    bars[i].drawBar();
  }
}

void resetGrid() {
  for (int i = 0; i<grid.length; i++) {
    for (int j =0; j<grid.length; j++) {
      b.visited[i][j] = 0;
      grid[i][j].tileSetOffVisited();
    }
  }
}


void getOSStats() {
  Object value;
  int yCoor = 57;
  for (Method method : osBean.getClass().getDeclaredMethods()) {
    method.setAccessible(true);
    if (method.getName().startsWith("get")
      && Modifier.isPublic(method.getModifiers())) {
      try {
        value = method.invoke(osBean);
      } 
      catch (Exception e) {
        value = e;
      } // try
      textSize(12);
      fill(0);
      text(method.getName() + " = " + value, 46, yCoor, 550, 4000);
      yCoor += 25;
    } // if
  } // for
}


void draw() {
  background(100);
  redoDrawBars();
  getOSStats();
}
