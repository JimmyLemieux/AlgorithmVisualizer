import java.util.*;

class DFS extends Thread {
  Tile grid[][];
  Tile genesis;
  int visited[][];
  GraphHelper gh;

  public DFS(Tile genesis, Tile grid[][]) {
    this.grid = grid;
    this.genesis = genesis;

    this.gh = new GraphHelper(this.grid);

    this.visited = new int[grid.length][grid.length];
    for (int i = 0; i<grid.length; i++) {
      for (int j = 0; j<grid.length; j++) {
        visited[i][j] = 0;
      }
    }
  }

  public void traverse(Tile nTile) {

    PVector gridPos = nTile.gridPos();
    int x = (int)gridPos.x;
    int y = (int)gridPos.y;
    visited[x][y] = 1;
    nTile.tileSetVisited();
    delay(50);

    PVector[] adj = this.gh.getNeighbours(nTile);
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
