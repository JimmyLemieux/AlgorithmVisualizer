Tile grid[][];
Tile genesisBlock;
GraphHelper gh;
BarHelper bh;
Bar bar;
Bar bars[];
DFS d;
BFS b;

int c = 0;
boolean start = false;
int squareSize = 20;
int cols, rows;

void setup() {
  size(600, 600);
  background(255);
  randomSeed(second());
  frameRate(60);
  cols = width/squareSize;
  rows = height/squareSize;
  grid = new Tile[rows][cols];

  initGrid();

  //gh = new GraphHelper(grid);
  //Tile genesisBlock = gh.generateGenesisBlock(rows, cols);
  //d = new DFS(genesisBlock, grid);
  //b = new BFS(genesisBlock, grid);

  bars = new Bar[cols];
  
  println(cols);

  for (int i =0; i<cols; i++) {
    bars[i] = new Bar(i * squareSize, i * squareSize, squareSize, height, (cols - i) - 1);
  }

  bh = new BarHelper(bars);
  //bar = new Bar(0,height/2,squareSize,height);

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

void resetGrid() {
  for (int i = 0; i<grid.length; i++) {
    for (int j =0; j<grid.length; j++) {
      b.visited[i][j] = 0;
      grid[i][j].tileSetOffVisited();
    }
  }
}

void printBars(Bar bars[]) {
  for (int i =0; i<bars.length; i++) {
    println(bars[i].indexNumber);
  }
}

void draw() {
  // redoDraw();
  //bar.drawBar();

  this.bars = bh.barState();

  for (int i = 0; i<bars.length; i++) {
    bars[i].drawBar();
  }
}

void mousePressed() {

  //resetGrid();
  printBars(bars);
}
