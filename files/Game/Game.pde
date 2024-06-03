private int score;
private int framesElapsed;
private float speed;
private Block[][] map;
private ArrayList<Block> blockList = new ArrayList<Block>();
private BlockGroup nextPiece;
private BlockGroup currentPiece;
private Block test;
void setup() {
  size(500, 800);
  background(0);
  map = new Block[25][10];
  test = new Block(12, 0, 0);
  blockList.add(test);
  frameRate(30);
  framesElapsed = 30;
  currentPiece = new IBlock(5, 0);
  nextPiece = new IBlock(-5, 0);
}
void draw() {
  background(0);
  int i = 0;
  while (i < blockList.size()) {
    blockList.get(i).display();
    i++;
  }
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
    framesElapsed = 30;
  } else {
    framesElapsed--;
  }
}
void keyPressed() {
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
    
    currentPiece = new IBlock(5, 0);
    replacePiece();
    replacePiece();
  }
}
void tick() {
  if (currentPiece.canFall(map)) {
    clearPiece();
    test.down();
    currentPiece.down(map);
    replacePiece();
    printMap();
  }
  else {
    clearPiece();
    currentPiece.deposit();
    replacePiece();
    
    currentPiece = new IBlock(5, 0);
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
