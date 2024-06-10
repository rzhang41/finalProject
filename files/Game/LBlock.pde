class LBlock extends BlockGroup {
  LBlock(int x, int y) {
    super(x, y);
    super.type = 4;
    super.block1 = new Block(super.type, x, y);
    super.block2 = new Block(super.type, x - 1, y);
    super.block3 = new Block(super.type, x - 1, y + 1);
    super.block4 = new Block(super.type, x + 1, y);
    super.blockList = new Block[] {super.block1, super.block2, super.block3, super.block4};
  }
  LBlock copy() {
    return new LBlock(4, 0);
  }
  void displayHolding() {
    color tileColor = color(240, 95, 34);
    fill(tileColor);
    rect(90, 120, 30, 30);
    rect(30, 150, 30, 30);
    rect(60, 150, 30, 30);
    rect(90, 150, 30, 30);
    fill(color(red(tileColor) * .85, green(tileColor) * .85, blue(tileColor) * .85));
    rect(95, 125, 20, 20);
    rect(35, 155, 20, 20);
    rect(65, 155, 20, 20);
    rect(95, 155, 20, 20);
  }
}
