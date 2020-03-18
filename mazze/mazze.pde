
int squareSize = 10;
int cols, rows;
Tile grid[][];
Tile genesisBlock;
int c = 0;
boolean start = false;

DFS d;
BFS b;
void setup() {
  size(600, 600);
  background(255);
  randomSeed(second());
  frameRate(60);
  cols = height/squareSize;
  rows = width/squareSize;
  grid = new Tile[rows][cols];

  for (int i = 0; i<rows; i++) {
    for (int j = 0; j<cols; j++) {
      grid[i][j] = new Tile(i * squareSize, j*squareSize, squareSize);
    }
  }

  int rRow, rCol;
  rRow = (int)random(0, rows);
  rCol = (int) random(0, cols);


  genesisBlock = grid[rRow][rCol]; 
  d = new DFS(genesisBlock, grid);
  b = new BFS(genesisBlock, grid);
  b.start();

}

void redoDraw() {
  for (int i =0; i<rows; i++) {
    for (int j =0; j<cols; j++) {
      grid[i][j].display();
    }
  }
}

void resetGrid() {
   for (int i = 0;i<grid.length;i++) {
      for (int j =0;j<grid.length;j++) {
        b.visited[i][j] = 0;
         grid[i][j].tileSetOffVisited();
      }
   }
}

void draw() {

  redoDraw();
  println(c);
  c++;
  start = true;
}

void mousePressed() {
  
  resetGrid();
  
}
