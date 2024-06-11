class IBlock extends BlockGroup {
  IBlock(int x, int y) {
    super(x, y);
    super.type = 2;
    super.block1 = new Block(2, x + 1, y);
    super.block2 = new Block(2, x + 2, y);
    super.block3 = new Block(2, x - 1, y);
    super.block4 = new Block(2, x, y);
    super.blockList = new Block[] {super.block1, super.block2, super.block3, super.block4};
  }
  /*
  void down() {
    super.centerY++;
    int i = 0;
    while (i < super.blockList.length) {
      super.blockList[i].down();
    }
  }
  */
  IBlock copy() {
    return new IBlock(4, 0);
  }
  void displayHolding() {
    color tileColor = color(52, 207, 235);
    fill(tileColor);
    rect(15, 135, 30, 30);
    rect(45, 135, 30, 30);
    rect(75, 135, 30, 30);
    rect(105, 135, 30, 30);
    fill(color(red(tileColor) * .85, green(tileColor) * .85, blue(tileColor) * .85));
    rect(20, 140, 20, 20);
    rect(50, 140, 20, 20);
    rect(80, 140, 20, 20);
    rect(110, 140, 20, 20);
  }
  void displayNext() {
    color tileColor = color(52, 207, 235);
    fill(tileColor);
    rect(15, 260, 30, 30);
    rect(45, 260, 30, 30);
    rect(75, 260, 30, 30);
    rect(105, 260, 30, 30);
    fill(color(red(tileColor) * .85, green(tileColor) * .85, blue(tileColor) * .85));
    rect(20, 265, 20, 20);
    rect(50, 265, 20, 20);
    rect(80, 265, 20, 20);
    rect(110, 265, 20, 20);
  }
  
}
