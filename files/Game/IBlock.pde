class IBlock extends BlockGroup {
  IBlock(int x, int y) {
    super(x, y);
    super.type = 2;
    super.block1 = new Block(2, x + 1, y);
    super.block2 = new Block(2, x, y - 1);
    super.block3 = new Block(2, x - 1, y);
    super.block4 = new Block(2, x, y);
    super.blockList = new Block[] {super.block1, super.block2, super.block3, super.block4};
  }
  void down() {
    super.centerY++;
    int i = 0;
    while (i < super.blockList.length) {
      super.blockList[i].down();
    }
  }
}
