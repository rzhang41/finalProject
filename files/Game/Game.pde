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
}
void draw() {
  background(0);
  int i = 0;
  while (i < blockList.size()) {
    blockList.get(i).display();
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
    currentPiece.moveL();
    replacePiece();
  }
  if (key == 100) {
    clearPiece();
    currentPiece.moveR();
    replacePiece();
  }
  if (key == 115) {
    currentPiece.down(map);
  }
  if (key == 44) {
    clearPiece();
    currentPiece.rotateL();
    replacePiece();
  } 
  if (key == 46) {
    clearPiece();
    currentPiece.rotateR();
    replacePiece();
  }
}
void tick() {
  clearPiece();
  test.down();
  currentPiece.down(map);
  replacePiece();
  printMap();
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
      output = output + map[i][j];
      if (j != map[0].length - 1) {
        output = output + ", ";
      }
      j++;
    }
    output = output + "}" + "\n" + "{";
    i++;
  }
  System.out.println(output);
}
