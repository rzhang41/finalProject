class LBlock extends BlockGroup {
  LBlock(int x, int y) {
    super(x, y);
    super.type = 4;
    super.block1 = new Block(super.type, x, y);
    super.block2 = new Block(super.type, x - 1, y);
    super.block3 = new Block(super.type, x - 1, y + 1);
    super.block4 = new Block(super.type, x + 1, y);
  }
}
