class BlockGroup {
  
  private Block[][] group;
  private Block[] blockList;
  private Block block1, block2, block3, block4;
  private int centerX, centerY;
  private int type;
  BlockGroup(int newCenterX, int newCenterY) {
    group = new Block[][] {
      {null, null, null, null, null},
      {null, null, null, null, null},
      {null, null, null, null, null},
      {null, null, null, null, null},
      {null, null, null, null, null}
    };
    centerX = newCenterX;
    centerY = newCenterY;
  }
  void down(Block[][] map) {
    int i = 0;
    boolean canFall = true;
    while (i < blockList.length) {
      int thisX = blockList[i].getX();
      int thisY = blockList[i].getY();
      if (thisY + 1 == map.length) {
        canFall = false;
        break;
      }
      if (map[thisY + 1][thisX] != null) {
        canFall = false;
        break;
      }
      i++;
    }
    i = 0;
    if (canFall) {
      while (i < blockList.length) {
        blockList[i].down();
        i++;
      }
      centerY++;
    }
  }
  void display() {
    int i = 0;
    while (i < blockList.length) {
      blockList[i].display();
      i++;
    }
    
  }
  void moveR() {
    int i = 0;
    while (i < blockList.length) {
      blockList[i].moveRight();
      i++;
    }
    centerX++;
  }
  void moveL() {
    int i = 0;
    while (i < blockList.length) {
      blockList[i].moveLeft();
      i++;
    }
    centerX--;
  }
  void rotateR() {
    int i = 0;
    while (i < blockList.length) {
      int distanceX = blockList[i].getX() - centerX;
      int distanceY = blockList[i].getY() - centerY;
      blockList[i].setX(centerX + distanceY);
      blockList[i].setY(centerY + (-1 * distanceX));
      group[2 + distanceY][2 + distanceX] = null;
      group[2 + (-1 * distanceX)][2 + distanceY] = blockList[i];
      i++;
    }
  }
}
