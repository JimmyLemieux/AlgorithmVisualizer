import processing.sound.*;
import java.util.*;
Tile grid[][];
Tile genesisBlock;
GraphHelper gh;
BarHelper bh;
Bar bar;
ArrayUtil au;
Bar bars[];
DFS d;
BFS b;
SinOsc sin;

int c = 200;
boolean start = false;
int squareSize = 10;
int cols, rows;

void setup() {
  size(600, 600);
  background(100);
  randomSeed(second());
  frameRate(60);
  cols = width/squareSize;
  rows = height/squareSize;
  grid = new Tile[rows][cols];



  sin = new SinOsc(this);


  bars = new Bar[cols];


  for (int i =0; i<cols; i++) {
    // xPos, yPos, width, height, indexNumber
    bars[i] = (new Bar(i * squareSize, i * squareSize, squareSize, height, (cols - i) - 1));
  }



  bh = new BarHelper(bars);


  //  sin.play();
  bh.shuffleBars();
  bh.start();
}

void initGrid() {
  for (int i = 0; i<rows; i++) {
    for (int j = 0; j<cols; j++) {
      grid[i][j] = new Tile(i * squareSize, j*squareSize, squareSize);
    }
  }
}

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

void printBars() {
  println(bars.length);
  for (int i =0; i<bars.length; i++) {
    println(bars[i].indexNumber);
  }
}


void draw() {
  // redoDraw();
  //bar.drawBar();
  background(100);
  redoDrawBars();
}

void mousePressed() {

  printBars();
}
