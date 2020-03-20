Tile grid[][];
Tile genesisBlock;
GraphHelper gh;
Bar bar;
Bar bars[];
DFS d;
BFS b;

int c = 0;
boolean start = false;
int squareSize = 10;
int cols, rows;

void setup() {
  size(600, 600);
  background(255);
  randomSeed(second());
  frameRate(60);
  cols = height/squareSize;
  rows = width/squareSize;
  grid = new Tile[rows][cols];

  initGrid();

  //gh = new GraphHelper(grid);
  //Tile genesisBlock = gh.generateGenesisBlock(rows, cols);
  //d = new DFS(genesisBlock, grid);
  //b = new BFS(genesisBlock, grid);
  
  bars = new Bar[rows];
  
  for (int i =0;i<rows;i++) {
    bars[i] = new Bar(i * squareSize,i * squareSize,10,height, i);
  }
    //bar = new Bar(0,height/2,squareSize,height);
  
  
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

void draw() {
  // redoDraw();
  //bar.drawBar();
  
  for (int i = 0;i<rows;i++) {
    bars[i].drawBar();
  }
  
  
  
}

void mousePressed() {

  resetGrid();
}
