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
  if (framesElapsed <= 0) {
    tick();
    framesElapsed = 30;
  } else {
    framesElapsed--;
  }
}
void keyPressed() {
  if (key == 44) {
    blockList.get(0).moveLeft();
    redraw();
  } else if (key == 46) {
    blockList.get(0).moveRight();
    redraw();
  }
}
void tick() {

  test.down();
  currentPiece.down();
}
