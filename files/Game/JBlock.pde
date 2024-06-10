public class JBlock extends BlockGroup {
  JBlock(int x, int y) {
    super(x, y);
    super.type = 6;
    super.block1 = new Block(super.type, x, y);
    super.block2 = new Block(super.type, x - 1, y);
    super.block3 = new Block(super.type, x + 1, y);
    super.block4 = new Block(super.type, x + 1, y + 1);
    super.blockList = new Block[] {super.block1, super.block2, super.block3, super.block4};
  }
  JBlock copy() {
    return new JBlock(4, 0);
  }
  void displayHolding() {
    color tileColor = color(50, 79, 219);
    fill(tileColor);
    rect(30, 120, 30, 30);
    rect(30, 150, 30, 30);
    rect(60, 150, 30, 30);
    rect(90, 150, 30, 30);
    fill(color(red(tileColor) * .85, green(tileColor) * .85, blue(tileColor) * .85));
    rect(35, 125, 20, 20);
    rect(35, 155, 20, 20);
    rect(65, 155, 20, 20);
    rect(95, 155, 20, 20);
  }
}
