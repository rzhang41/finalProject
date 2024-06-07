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
}
