private int score;
private int framesElapsed;
private int speed;
private Block[][] map;
private BlockGroup nextPiece;
private BlockGroup currentPiece;
private boolean canSwap;
void setup() {
  size(500, 800);
  background(0);
  map = new Block[25][10];
  frameRate(30);
  framesElapsed = 30;
  currentPiece = randomBlock(100);
  nextPiece = randomBlock(currentPiece.getType() / 2);
  score = 0;
  canSwap = true;
  speed = 1;
}
void draw() {
  if (!checkForGameOver()) {
    background(150);
    fill(0);
    rect(150, 45, 300, 720);
    fill(255, 10, 10);
    rect(22.5, 37.50, 105.5, 35, 10);
    fill(0);
    rect(25, 40, 100, 30, 10);
    text("SCORE", 57, 35);
    fill(255);
    text(score, 40, 60);
    int i = 0;
    i = 0;
    while (i < map.length) {
      int j = 0;
      while (j < map[0].length) {
        if (map[i][j] != null) {
          map[i][j].display();
        }
        j++;
      }
      i++;
    }
    currentPiece.display();
    if (framesElapsed <= 0) {
      tick();
      framesElapsed = speed;
    } else {
      framesElapsed--;
    }
    i = 0;
    while (i < map.length) {
      if (rowFilled(map[i])) {
        clearRow(i);
      }
      i++;
    }
  }
}
void keyPressed() {
    if (!checkForGameOver()) {
      if (key == 97) {
        clearPiece();
        currentPiece.moveL(map);
        replacePiece();
      }
      if (key == 100) {
        clearPiece();
        currentPiece.moveR(map);
        replacePiece();
      }
      if (key == 115) {
        clearPiece();
        if (currentPiece.canFall(map)) {
          framesElapsed = speed;
        }
        currentPiece.down(map);
        replacePiece();
      }
      if (key == 44) {
        clearPiece();
        currentPiece.rotateL(map);
        replacePiece();
      } 
      if (key == 46) {
        clearPiece();
        currentPiece.rotateR(map);
        replacePiece();
      }
      if (key == 119) {
        clearPiece();
        while (currentPiece.canFall(map)) {
          currentPiece.down(map);
        }
        currentPiece.deposit();
        replacePiece();
        currentPiece = nextPiece;
        nextPiece = randomBlock(currentPiece.getType() / 2);
        replacePiece();
        framesElapsed = speed;
        canSwap = true;
      }
      if (key == 32) {
        if (canSwap) {
          clearPiece();
          BlockGroup temp = currentPiece;
          currentPiece = nextPiece.copy();
          nextPiece = temp.copy();
          replacePiece();
          canSwap = false;
          framesElapsed = speed;
        }
      }
    }
}
void tick() {
  if (currentPiece.canFall(map)) {
    clearPiece();

    currentPiece.down(map);
    replacePiece();
    printMap();
  }
  else {
    clearPiece();
    currentPiece.deposit();
    replacePiece();
    currentPiece = nextPiece;
    nextPiece = randomBlock(currentPiece.getType() / 2);
    canSwap = true;
    replacePiece();
    
  }

}
void clearPiece() {
  Block[] list = currentPiece.getBlockList();
  int i = 0;
  while (i < list.length) {
    int x = list[i].getX();
    int y = list[i].getY();
    map[y][x] = null;
    i++;
  }
}
void replacePiece() {
  Block[] list = currentPiece.getBlockList();
  int i = 0;
  while (i < list.length) {
    int x = list[i].getX();
    int y = list[i].getY();
    map[y][x] = list[i];
    i++;
  }
}
void printMap() {
  int i = 0;
  String output = "{";
  while (i < map.length) {
    int j = 0;
    while (j < map[0].length) {
      if (map[i][j] != null) {
        output = output + map[i][j].getType();
      }
      else {
        output = output + map[i][j];
      }
      if (j != map[0].length - 1) {
        output = output + ", ";
      }
      j++;
    }
    output = output + "}" + "\n" + "{";
    i++;
  }
  System.out.println(output + "\n");
}
void clearRow(int row) {
  int i = 0;
  while (i < map[0].length) {
    map[row][i] = null;
    i++;
  }
  row--;
  while (row != 0) {
    System.out.println("row: " + row);
    int col = 0;
    while (col < map[0].length) {
      if (map[row][col] != null) {
        if (map[row][col].getType() % 2 == 1) {
          map[row][col].setY(map[row][col].getY() + 1);
          map[row + 1][col] = map[row][col];
          map[row][col] = null;

        }
      }
      col++;
    }
    row--;
  }
  score = score + 1000;
  if (score == 5000) {
    speed = speed - 8;
  }
  if (score == 10000) {
    speed = speed - 5;
  }
  if (score == 15000) {
    speed = speed - 4;
  }
  if (score == 25000) {
    speed = speed - 3;
  }
  if (score == 35000) {
    speed = speed - 3;
  }
  if (score == 45000) {
    speed = speed - 2;
  }
  if (score == 55000) {
    speed = speed - 1;
  }
  if (score == 65000) {
    speed = speed - 1;
  }
  if (score == 75000) {
    speed = speed - 1;
  }
  if (score == 100000) {
    speed = speed - 1;
  }
}
boolean rowFilled(Block[] row) {
  boolean rowNotFilled = false;
  int i = 0;
  while (i < row.length) {
    if (row[i] == null) {
      rowNotFilled = true;
      break;
    }
    if (row[i].getType() % 2 != 1) {
      rowNotFilled = true;
      break;
    }
    i++;
  }
  return !rowNotFilled;
}
BlockGroup randomBlock(int dropped) {
  int random = (int)(Math.random() * 7 + 1);
  while (random == dropped) {
    random = (int)(Math.random() * 7 + 1);
  }
  System.out.println("Random: " + random);
  switch (random) {
    case 1:
    return new IBlock(4, 0);
    case 2:
    return new LBlock(4, 0);
    case 3:
    return new JBlock(4, 0);
    case 4:
    return new SRBlock(4, 0);
    case 5:
    return new SLBlock(4, 0);
    case 6:
    return new TBlock(4, 0);
    case 7: 
    return new BBlock(4, 0);
  }
  return new IBlock(4, 0);
}
boolean checkForGameOver() {
  boolean anyBlocksHere = false;
  int i = 0;
  while (i < 2) {
    int j = 0;
    while (j < map[0].length) {
      if (map[i][j] != null) {
        if (map[i][j].getType() % 2 == 1) {
          anyBlocksHere = true;
          break;
        }
      }
      j++;
    }
    i++;
  }
  return anyBlocksHere;
}
