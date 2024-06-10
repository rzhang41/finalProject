class SRBlock extends BlockGroup {
  SRBlock(int x, int y) {
    super(x, y);
    super.type = 8;
    super.block1 = new Block(super.type, x, y);
    super.block2 = new Block(super.type, x + 1, y);
    super.block3 = new Block(super.type, x, y + 1);
    super.block4 = new Block(super.type, x - 1, y + 1);
    super.blockList = new Block[] {super.block1, super.block2, super.block3, super.block4};
  }
  SRBlock copy() {
    return new SRBlock(4, 0);
  }
  void displayHolding() {
    color tileColor = color(102, 237, 81);
    fill(tileColor);
    rect(30, 150, 30, 30);
    rect(60, 150, 30, 30);
    rect(60, 120, 30, 30);
    rect(90, 120, 30, 30);
    fill(color(red(tileColor) * .85, green(tileColor) * .85, blue(tileColor) * .85));
    rect(35, 155, 20, 20);
    rect(65, 155, 20, 20);
    rect(65, 125, 20, 20);
    rect(95, 125, 20, 20);
  }
}
