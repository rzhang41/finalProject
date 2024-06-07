class BlockGroup {
  
  private Block[][] group;
  private Block[] blockList;
  private Block block1, block2, block3, block4;
  private int centerX, centerY;
  private int type;
  private int rotation;
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
    rotation = 0;
  }
  void down(Block[][] map) {
    int i = 0;
    boolean canFall = true;
    while (i < blockList.length) {
      int thisX = blockList[i].getX();
      int thisY = blockList[i].getY();
      if (thisY + 1 >= 24) {
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
    fill(244, 244, 244);
    ellipse(165 + 30 * centerX, 60 + 30 * centerY, 20, 20);
    
  }
  void moveR(Block[][] map) {
    int i = 0;
    boolean canMove = true;
    while (i < blockList.length) {
      if (blockList[i].canMoveRight(map) == false) {
        canMove = false;
      }
      i++;
    }
    i = 0;
    if (canMove) {
      while (i < blockList.length) {
        blockList[i].moveRight();
        i++;
      }
      centerX++;
    }
    
  }
  void moveL(Block[][] map) {
    int i = 0;
    boolean canMove = true;
    while (i < blockList.length) {
      if (blockList[i].canMoveLeft(map) == false) {
        canMove = false;
      }
      i++;
    }
    i = 0;
    if (canMove) {
      while (i < blockList.length) {
        blockList[i].moveLeft();
        i++;
      }
      centerX--;
    }
  }
  void moveUp() {
    int i = 0;
    boolean canMove = true;
    while (i < blockList.length) {
      if (blockList[i].getY() <= 0) {
        canMove = false;
        break;
      }
      i++;
    }
    i = 0;
    if (canMove) {
      while (i < blockList.length) {
        blockList[i].moveUp();
        i++;
      }
      centerY--;
    }

  }
  void rotateL(Block[][] map) {
    int i = 0;
    boolean canRotate = true;
    while (i < blockList.length) {
      int newX;
      int newY;
      int distanceX = blockList[i].getX() - centerX;
      int distanceY = blockList[i].getY() - centerY;
      newX = centerX + distanceY;
      newY = centerY + (-1 * distanceX);
      if (newY < 0 || newY >= 24) {
        canRotate = false;
        break;
      }
      if (newX < 0 || newX >= 10) {
        canRotate = false;
        break;
      }
      if (map[newY][newX] != null && map[newY][newX].getType() % 2 != 0) {
        canRotate = false;
        break;
      }
      i++;
    }
    i = 0; 
    if (canRotate) {
      while (i < blockList.length) {
        int distanceX = blockList[i].getX() - centerX;
        int distanceY = blockList[i].getY() - centerY;
        blockList[i].setX(centerX + distanceY);
        blockList[i].setY(centerY + (-1 * distanceX));
        group[2 + distanceY][2 + distanceX] = null;
        group[2 + (-1 * distanceX)][2 + distanceY] = blockList[i];
        i++;
      }
      rotation--;
      if (rotation < 0) {
        rotation = 3;
      }
    }
    /*
    i = 0;
    while (i < blockList.length) {
      if (blockList[i].getX() > 9) {
        while(blockList[i].getX() > 9) {
          moveL(map);
        }
      }
      if (blockList[i].getX() < 0) {
        while(blockList[i].getX() < 0) {
          moveR(map);
        }
      }
      if (blockList[i].getY() > 23) {
        while (blockList[i].getY() > 23) {
          moveUp();
        }
      }
      i++;
    }
    */
  }
  void rotateR(Block[][] map) {
    int i = 0;
    boolean canRotate = true;
    while (i < blockList.length) {
      int distanceX = blockList[i].getX() - centerX;
      int distanceY = blockList[i].getY() - centerY;
      int newX = centerX + (-1 * distanceY);
      int newY = centerY + distanceX;
      if (newY < 0 || newY >= 24) {
        canRotate = false;
        break;
      }
      if (newX < 0 || newX >= 10) {
        canRotate = false;
        break;
      }
      if (map[newY][newX] != null && map[newY][newX].getType() % 2 != 0) {
        canRotate = false;
        break;
      }
      i++;
    }
    if (canRotate) {
      i = 0;
      while (i < blockList.length) {
        int distanceX = blockList[i].getX() - centerX;
        int distanceY = blockList[i].getY() - centerY;
        blockList[i].setX(centerX + (-1 * distanceY));
        blockList[i].setY(centerY + distanceX);
  
        group[2 + distanceY][2 + distanceX] = null;
  
        group[2 + distanceX][2 + (-1 * distanceY)] = blockList[i];
        i++;
      }
      i = 0;
      while (i < blockList.length) {
        if (blockList[i].getX() > 9) {
          while(blockList[i].getX() > 9) {
            moveL(map);
          }
        }
        if (blockList[i].getX() < 0) {
          while(blockList[i].getX() < 0) {
            moveR(map);
          }
        }
        if (blockList[i].getY() > 23) {
          while (blockList[i].getY() > 23) {
            moveUp();
          }
        }
        i++;
      }
      rotation++;
      if (rotation > 3) {
        rotation = 0;
      }
    }
  }
  public void deposit() {
    int i = 0;
    while (i < blockList.length) {
      blockList[i].setType(blockList[i].getType() - 1);
      i++;
    }
  }
  Block[] getBlockList() {
    return blockList;
  }
  boolean canFall(Block[][] map) {
    int i = 0;
    boolean canFall = true;
    while (i < blockList.length) {
      if (!blockList[i].canFall(map)) {
        canFall = false;
        break;
      }
      i++;
    }
    return canFall;
  }
  int getX() {
    return centerX;
  }
  int getY() {
    return centerY;
  }
  int getType() {
    return type;
  }
  int getRotation() {
    return rotation;
  }
  BlockGroup copy() {
    return null;
  }
  void displayHolding() {
  }
}
