import java.util.Queue;
import java.util.ArrayDeque;
class BFS extends Thread {

  Tile grid[][];
  Tile genesisBlock;
  int visited[][];
  GraphHelper gh;



  public BFS(Tile genBlock, Tile grid[][]) {
    this.genesisBlock = genBlock;
    this.grid = grid;
    this.gh = new GraphHelper(this.grid);
    this.visited = new int[grid.length][grid.length];

    // fill the visited array
    for (int i =0; i<grid.length; i++ ) {      
      for (int j =0; j<grid.length; j++) {
        this.visited[i][j] = 0;
      }
    }
  }

  public void traverse(Tile nTile) {
    final Queue<Tile> q = new ArrayDeque(2000000);
    // Set visited then add to queue

    PVector gridPos = nTile.gridPos();
    int x = (int) gridPos.x;
    int y = (int) gridPos.y;

    this.visited[x][y] = 1;

    nTile.tileSetVisited();

    q.add(nTile);


    while (!q.isEmpty()) {

      Tile aTile = q.poll();

      PVector[] adj = this.gh.getNeighbours(aTile);

      for  (int i =0; i<adj.length; i++) {
        if (adj[i] != null) {
          PVector adjPos = adj[i];

          int aX =  (int) adjPos.x;
          int aY = (int) adjPos.y;

          if (visited[aX][aY] != 1) {
            visited[aX][aY ] = 1;
            grid[aX][aY].tileSetVisited();
            delay(20);
            q.add(grid[aX][aY]);
          }
        }
      }
    }
  }


  public void run() {
    traverse(this.genesisBlock);
  }
}
