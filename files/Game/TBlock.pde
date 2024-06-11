class TBlock extends BlockGroup {
  TBlock(int x, int y) {
    super(x, y);
    super.type = 12;
    super.block1 = new Block(super.type, x, y);
    super.block2 = new Block(super.type, x - 1, y);
    super.block3 = new Block(super.type, x + 1, y);
    super.block4 = new Block(super.type, x, y + 1);
    super.blockList = new Block[] {super.block1, super.block2, super.block3, super.block4};
  }
  TBlock copy() {
    return new TBlock(4, 0);
  }
  void displayHolding() {
    color tileColor = color(145, 7, 250);
    fill(tileColor);
    rect(60, 120, 30, 30);
    rect(30, 150, 30, 30);
    rect(60, 150, 30, 30);
    rect(90, 150, 30, 30);
    fill(color(red(tileColor) * .85, green(tileColor) * .85, blue(tileColor) * .85));
    rect(65, 125, 20, 20);
    rect(35, 155, 20, 20);
    rect(65, 155, 20, 20);
    rect(95, 155, 20, 20);
  }
  void displayNext() {
    color tileColor = color(145, 7, 250);
    fill(tileColor);
    rect(60, 245, 30, 30);
    rect(30, 275, 30, 30);
    rect(60, 275, 30, 30);
    rect(90, 275, 30, 30);
    fill(color(red(tileColor) * .85, green(tileColor) * .85, blue(tileColor) * .85));
    rect(65, 250, 20, 20);
    rect(35, 280, 20, 20);
    rect(65, 280, 20, 20);
    rect(95, 280, 20, 20);
  }
}
