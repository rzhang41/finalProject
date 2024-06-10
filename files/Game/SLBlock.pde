class SLBlock extends BlockGroup {
  SLBlock(int x, int y) {
    super(x, y);
    super.type = 10;
    super.block1 = new Block(super.type, x, y);
    super.block2 = new Block(super.type, x - 1, y);
    super.block3 = new Block(super.type, x, y + 1);
    super.block4 = new Block(super.type, x + 1, y + 1);
    super.blockList = new Block[] {super.block1, super.block2, super.block3, super.block4};
  }
  SLBlock copy() {
    return new SLBlock(4, 0);
  }
  void displayHolding() {
    color tileColor = color(255, 7, 7);
    fill(tileColor);
    rect(30, 120, 30, 30);
    rect(60, 120, 30, 30);
    rect(60, 150, 30, 30);
    rect(90, 150, 30, 30);
    fill(color(red(tileColor) * .85, green(tileColor) * .85, blue(tileColor) * .85));
    rect(35, 125, 20, 20);
    rect(65, 125, 20, 20);
    rect(65, 155, 20, 20);
    rect(95, 155, 20, 20);
  }
}
