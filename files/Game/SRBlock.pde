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
}
