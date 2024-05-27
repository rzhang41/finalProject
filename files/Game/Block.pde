class Block {
  /*
  1 = Inactive I block
  2 = Active I block
  3 = Inactive L block
  4 = Active L block
  5 = Inactive J block
  6 = Active J block
  7 = Inactive SR block
  8 = Active SR block
  9 = Inactive SL block
  10 = Active SL block
  11 = Inactive T block
  12 = Active T block
  */
  private int type;
  private int x, y;
  private int tileWidth;
  Block(int newType, int newX, int newY) {
    type = newType;
    x = newX;
    y = newY;
    System.out.println(x + ", " + y);
    tileWidth = 30;
  }
  boolean canFall(Block[][] map) { 
    if ((y + 1) < map.length) {
      if (map[y + 1][x].getType() == 0) {
        return true;
      }
    }
    return false;
  }
  void down() {
    if (y != 23) {
      y = y + 1;
    }
  }
  void moveLeft() {
    if (x != 0) {
      x = x - 1;
    }
  }
  void moveRight() {
    if (x != 9) {
      x = x + 1;
    }
  }
  void rotate() {
  }
  void display() {
    color tileColor;
    if (type == 1 || type == 2) {
      tileColor = color(52, 207, 235);
    }
    else if (type == 3 || type == 4) {
      tileColor = color(240, 95, 34);
    }
    else if (type == 5 || type == 6) {
      tileColor = color(50, 79, 219);
    }
    else if (type == 7 || type == 8) {
      tileColor = color(102, 237, 81);
    }
    else if (type == 9 || type == 10) {
      tileColor = color(255, 7, 7);
    }
    else if (type == 11 || type == 12) {
      tileColor = color(145, 7, 250);
    }
    else {
      tileColor = color(255, 255, 255);
    }
    fill(tileColor);
    int thisX = (5 * tileWidth) + (x * tileWidth);
    int thisY = 45 + (y * tileWidth);
    square(thisX, thisY, tileWidth);
    //square(x - (tileWidth / 2), y - (tileWidth / 2), tileWidth);
  }
  int getX() {
    return x;
  }
  int getY() {
    return y;
  }
  int getType() {
    return type;
  }
}
