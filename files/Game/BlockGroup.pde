class BlockGroup {
  private Block[][] group;
  private Block[] blockList;
  private Block block1, block2, block3, block4;
  private int centerX, centerY;
  private int type;
  BlockGroup(int newCenterX, int newCenterY) {
    blockList = new Block[] {block1, block2, block3, block4};
    group = new Block[][] {
      {null, null, null, null, null},
      {null, null, null, null, null},
      {null, null, null, null, null},
      {null, null, null, null, null},
      {null, null, null, null, null}
    };
    centerX = newCenterX;
    centerY = newCenterY;
  }
  void down() {
  }
}
