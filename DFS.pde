import java.util.*;

class DFS extends Thread {
  Tile grid[][];
  Tile genesis;

  int visited[][];

  public DFS(Tile genesis, Tile grid[][]) {
    this.grid = grid;
    this.genesis = genesis;

    this.visited = new int[grid.length][grid.length];
    for (int i = 0; i<grid.length; i++) {
      for (int j = 0; j<grid.length; j++) {
        visited[i][j] = 0;
      }
    }
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

  public void traverse(Tile nTile) {

    PVector gridPos = nTile.gridPos();
    int x = (int)gridPos.x;
    int y = (int)gridPos.y;
    visited[x][y] = 1;
    nTile.tileSetVisited();
    delay(50);

    PVector[] adj = getNeighbours(nTile);
    for (int i = 0; i<adj.length; i++) {
      if (adj[i] != null) {
        PVector adjPos = adj[i];
        int aX = (int)adjPos.x;
        int aY = (int)adjPos.y;
        if (visited[aX][aY] == 0 && grid[aX][aY] != null) {
          traverse(grid[aX][aY]);
        }
      }
    }
  }

  public void run() {
    traverse(genesis);
  }
}
