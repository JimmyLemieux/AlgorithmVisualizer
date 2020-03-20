class GraphHelper {

  Tile grid[][];
  public GraphHelper(Tile grid[][]) {
    this.grid = grid;
  }

  public GraphHelper() {
  }

  public Tile generateGenesisBlock(int rows, int cols) {
    int rRow, rCol;
    rRow = (int)random(0, rows);
    rCol = (int) random(0, cols);
    return this.grid[rRow][rCol];
  }

  public PVector[] getNeighbours(Tile nTile) {
    // Neighbours are above, down, left, right
    PVector[] adj = new PVector[4];
    int index = 0;
    PVector gridPos = nTile.gridPos();
    int x = (int)gridPos.x;
    int y = (int)gridPos.y;

    if (y - 1 >= 0 && index != 4) {
      adj[index] = new PVector(x, y-1);   
      index++;
    }  

    if (y + 1 < this.grid[0].length && index != 4) {
      adj[index] = new PVector(x, y+1);
      index++;
    }  

    if (x + 1 < this.grid[0].length && index != 4) {
      adj[index] = new PVector(x+1, y);
      index++;
    } 
    if (x - 1 >= 0 && index != 4) {
      adj[index] = new PVector(x-1, y);
      index++;
    }

    return adj;
  }
}
