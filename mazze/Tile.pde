class Tile {
  int tempX, tempY, tileSize;
  boolean isVisited = false;


  Tile(int x, int y, int size) {
    this.tempX = x;
    this.tempY = y;
    this.tileSize = size;
  }

  PVector gridPos() {
    return new PVector(tempX/tileSize, tempY/tileSize);
  }


  void tileSetVisited() {
    this.isVisited = true;
  }

  void tileSetOffVisited() {
    this.isVisited = false;
  }

  void display() {
    if (isVisited) {
      fill(0);      
      stroke(255);
    } else {
      fill(255);
      stroke(0);
    }
    rect(tempX, tempY, tileSize, tileSize);
  }
}
