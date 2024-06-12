private int score;
private int framesElapsed;
private int speed;
private int timeUntilDeposit;
private Block[][] map;
private BlockGroup nextPiece;
private BlockGroup currentPiece;
private BlockGroup swap;
private boolean canSwap;
private ArrayList<Integer> currentBag;
void setup() {
  size(500, 800);
  background(0);
  map = new Block[25][10];
  frameRate(30);
  framesElapsed = 30;
  currentBag = new ArrayList<Integer>();
  int i = 1;
  while (i <= 7) {
    currentBag.add(i);
    i++;
  }
  currentPiece = randomBlock();
  nextPiece = randomBlock();
  score = 0;
  canSwap = true;
  speed = 30;
  timeUntilDeposit = 15;
  swap = null;
}
void draw() {
  if (!checkForGameOver()) {
    createMap();
    if (swap != null) {
      swap.displayHolding();
    }
    nextPiece.displayNext();
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
    nextPiece.displayNext();
    currentPiece.display();
    if (framesElapsed <= 0) {
      tick();
      framesElapsed = speed;
    } 
    else {
      framesElapsed--;
    }
    if (!currentPiece.canFall(map) && timeUntilDeposit != 0) {
      timeUntilDeposit--;
    }
    i = 0;
    while (i < map.length) {
      if (rowFilled(map[i])) {
        clearRow(i);
      }
      i++;
    }
  }
  else {
    displayGameOver();
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
        nextPiece = randomBlock();
        replacePiece();
        framesElapsed = speed;
        canSwap = true;
        timeUntilDeposit = 25;
      }
      if (key == 32) {
        if (canSwap) {
          clearPiece();
          if (swap != null) { 
            BlockGroup temp = currentPiece;
            currentPiece = swap.copy();
            swap = temp.copy();
            replacePiece();
            canSwap = false;
            framesElapsed = speed;
          }
          else {
            swap = currentPiece.copy();
            currentPiece = nextPiece.copy();
            nextPiece = randomBlock();
            replacePiece();
            canSwap = false;
            framesElapsed = speed;
          }
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
    if (timeUntilDeposit == 0) {
      clearPiece();
      currentPiece.deposit();
      replacePiece();
      currentPiece = nextPiece;
      nextPiece = randomBlock();
      canSwap = true;
      replacePiece();
      timeUntilDeposit = 30;
    }
    
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
BlockGroup randomBlock() {
  int i = 0;
  if (currentBag.size() > 0) {
      int random = (int)(Math.random() * currentBag.size());
      i = currentBag.get(random);
      currentBag.remove(random);
      switch (i) {
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
  else {
    int j = 1;
    while (j <= 7) {
      currentBag.add(j);
      j++;
    }
    return randomBlock();
  }
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
void createMap() { 
  strokeWeight(1);
  background(150);
  fill(0);
  rect(150, 45, 300, 720, 2);
  fill(255, 10, 10);
  rect(22.5, 37.50, 105.5, 35, 10);
  fill(0);
  rect(25, 40, 100, 30, 10);
  text("SCORE", 57, 35);
  fill(255);
  text(score, 40, 60);
  int i = 0;
  while (i < 9) {
    int x = (6 + i) * 30;
    fill(100);
    strokeWeight(.35);
    stroke(100);
    line(x, 45, x, 765);
    i++;
  }
  i = 0;
  while (i < 24) {
    int y = 45 + (i * 30);
    fill(100);
    strokeWeight(.35);
    stroke(100);
    line(150, y, 450, y);
    i++;
  }
  strokeWeight(1);
  stroke(0);
  fill(200, 30, 30);
  rect(150, 105, 300, 30);

  fill(0);
  rect(10, 100, 130, 100, 10);
  fill(0);
  text("HOLD", 60, 95);
  fill(0);
  rect(10, 225, 130, 100, 10);
  text("NEXT", 60, 220);
  text("CONTROLS", 45, 345);
  fill(130);
  rect(10, 350, 130, 300, 10);
  fill(0);
  text("MOVEMENT", 15, 365);
  text("ROTATION", 15, 420);
  text("SLOW DROP", 15, 475);
  text("FAST DROP", 15, 530);
  text("SWAP", 15, 585);
  fill(230);
  rect(20, 370, 30, 30, 5);
  rect(55, 370, 30, 30, 5);
  rect(20, 425, 30, 30, 5);
  rect(55, 425, 30, 30, 5);
  rect(20, 480, 30, 30, 5);
  rect(20, 535, 30, 30, 5);
  rect(20, 590, 110, 30, 5);
  fill(0);
  text("A", 28, 385);
  text("D", 63, 385);
  text("<", 28, 441);
  text(">", 63, 441);
  text("W", 27, 496);
  text("D", 27, 551);
  line(70, 615, 80, 615); 
  line(70, 615, 70, 614);
  line(80, 615, 80, 614);
  
}
void displayGameOver() {
  while (currentPiece.canFall(map)) {
    currentPiece.down(map);
  }
  fill(255, 0, 0);
  rect(150, 45, 300, 720, 2);
  fill(255, 234, 46);
  textSize(30);
  textAlign(CENTER);
  text("GAME OVER", 150, 385, 300, 400);
  textSize(15);
  text("Final Score: " + score, 150, 415, 300, 400);
  textSize(12);
}
