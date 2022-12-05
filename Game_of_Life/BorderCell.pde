/* BorderCell class
 extends: Cell
 
 A special type of cell, positioned at the borders of the universe.
 The state of this cell is always dead (false).
 
 **/

class BorderCell extends Cell {
  BorderCell(int col, int lin, Universe uni) {
    super(col, lin, uni);
    state = false;
  }

  void updateNeighbors() {
    return;
  }

  void getNextState() {
    nextState = false;
  }
}
