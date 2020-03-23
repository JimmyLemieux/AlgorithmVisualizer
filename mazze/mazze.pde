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
int squareSize = 1;
int cols, rows;

void setup() {
  size(1000, 600);
  background(100);
  randomSeed(second());
  frameRate(60);
  cols = width/squareSize;
  rows = height/squareSize;
  grid = new Tile[rows][cols];
  
  

  initGrid();
  
  sin = new SinOsc(this);

  //gh = new GraphHelper(grid);
  //Tile genesisBlock = gh.generateGenesisBlock(rows, cols);
  //d = new DFS(genesisBlock, grid);
  //b = new BFS(genesisBlock, grid);
  
  bars = new Bar[cols];

  
  for (int i =0; i<cols; i++) {
    bars[i] = (new Bar(i * squareSize, i * squareSize, squareSize, height, (cols - i) - 1));
  }
  
  //Collections.shuffle(bars);
  
   
  delay(1000);  


  bh = new BarHelper(bars, this);
  
  bh.shuffleBars();
  

  //bar = new Bar(0,height/2,squareSize,height);
  
  sin.play();
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
   for (int i = 0;i<bars.length;i++) {
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


void draw() {
  // redoDraw();
  //bar.drawBar();
  //background(100);
  redoDrawBars();

}
