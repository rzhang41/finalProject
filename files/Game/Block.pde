class Block {
  /*
  1 = Inactive I block
  2 = Active I block
  3 = Inactive L block
  4 = Active L block
  5 = Inactive J block
  6 = Active J block
  7 = Inactive S-Right block
  8 = Active S-Right block
  9 = Inactive S-Left block
  10 = Active S-Left block
  11 = Inactive T block
  12 = Active T block
  13 = Inactive Box Block;
  14 = Active Box Block;
  */
  private int type;
  private int x, y;
  private int tileWidth;
  Block(int newType, int newX, int newY) {
    type = newType;
    x = newX;
    y = newY;
    tileWidth = 30;
  }
  boolean canFall(Block[][] map) { 
    if (y < 23) {
      if (map[y + 1][x] == null || (map[y + 1][x].getType() != 0 && map[y + 1][x].getType() % 2 == 0)) {
        return true;
      }
    }
    return false;
  }
  void down() {
    if (y != 24) {
      y = y + 1;
    }
  }
  boolean canMoveLeft(Block[][] map) {
    if (x - 1 < 0) {
      return false;
    }
    else if (x + 1 < 10) {
      if (map[y][x - 1] != null) {  
        if (map[y][x - 1].getType() % 2 != 0) {
          return false;
        }
      }
    }
    return true;
  }
  boolean canMoveRight(Block[][] map) {
    if (x + 1 >= 10) {
      return false;
    }
    else if (x + 1 >= 0) {
      if (map[y][x + 1] != null) {
        if (map[y][x + 1].getType() % 2 != 0) {
          return false;
        }
      }
    }
    return true;
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
  void moveUp() {
    if (y >= 0) {
      y--;
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
    else if (type == 13 || type == 14) {
      tileColor = color(255, 234, 0);
    }
    else {
      tileColor = color(255, 255, 255);
    }
    fill(tileColor);
    int thisX = (5 * tileWidth) + (x * tileWidth);
    int thisY = 45 + (y * tileWidth);
    square(thisX, thisY, tileWidth);
    fill(color(red(tileColor) * .85, green(tileColor) * .85, blue(tileColor) * .85));
    square(thisX + 5, thisY + 5, tileWidth - 10);
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
  void setX(int newX) {
    x = newX;
  }
  void setY(int newY) {
    y = newY;
  }
  void setType(int newType) {
    type = newType;
  }
}
