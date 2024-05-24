private int score;
private float speed;
private Block[][] map;
private ArrayList<Block> blockList = new ArrayList<Block>();
private Block nextPiece;

void setup() {
  size(500, 800);
  background(0);
  Block test = new Block(5, 70, 0);
  blockList.add(test);
}
void draw() {
  background(0);
  int i = 0;
  while (i < blockList.size()) {
    blockList.get(i).display();
    i++;
  }
}
void keyPressed() {
  if (key == 44) {
    blockList.get(0).moveLeft();
  }
  else if (key == 46) {
    blockList.get(0).moveRight();
  }
}
void tick() {
}
