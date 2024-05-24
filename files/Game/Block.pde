class Block {
  /*
  1 = Inactive I block
  2 = Active I block
  3 = Inactive L block
  4 = Active L block
  5 = Inactive S block
  6 = Active S block
  7 = Inactive T block
  8 = Active T block
  */
  private int type;
  private int x, y;
  
  Block(int type, int newX, int newY) {
    type = this.type;
    x = newX;
    y = newY;
    System.out.println(x + ", " + y);
  }
  boolean canFall(Block[][] map) { 
    if (y + 1 < map.length) {
      if (map[y + 1][x] == null) {
        return true;
      }
    }
    return false;
  }
    
  void moveLeft() {
    x = x - 40;
  }
  void moveRight() {
    x = x + 40;
  }
  void rotate() {
  }
  void display() {
    square(x + 20, y + 20, 40);
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
