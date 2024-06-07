class BBlock extends BlockGroup {
  BBlock(int x, int y) {
    super(x, y);
    super.type = 14;
    super.block1 = new Block(super.type, x, y);
    super.block2 = new Block(super.type, x + 1, y);
    super.block3 = new Block(super.type, x, y + 1);
    super.block4 = new Block(super.type, x + 1, y + 1);
    super.blockList = new Block[] {super.block1, super.block2, super.block3, super.block4};
  }
  @Override
  void rotateL(Block[][] map) {
  }
  @Override
  void rotateR(Block[][] map) {
  }
  BBlock copy() {
    return new BBlock(4, 0);
  }
}
