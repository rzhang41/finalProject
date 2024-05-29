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
  map = new Block[24][10];
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
    currentPiece.moveL();
  }
  if (key == 100) {
    currentPiece.moveR();
  }
  else if (key == 44) {
    blockList.get(0).moveLeft();
    redraw();
  } else if (key == 46) {
    currentPiece.rotateR();

  }
}
void tick() {

  test.down();
  currentPiece.down(map);
}
