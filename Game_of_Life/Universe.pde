/* Universe class
 
 columns: total columns in universe matrix
 lines: total lines in universe matrix
 cells: matrix of cells of this universe
 
 populate(): generates the first generation of cells
 update(): update cells state according to the game of life rules
 
 **/

class Universe {
  int columns;
  int lines;
  Cell[][] cells;

  Universe(int col, int lin) {
    columns = col;
    lines = lin;
    cells = new Cell[lines][columns];
    populate();
  }

  void populate() {
    for (int i = 0; i < lines; i++) {
      for (int j = 0; j < columns; j++) {
        if (i == 0 || i == lines - 1 || j == 0 || j == columns - 1) {
          cells[i][j] = new BorderCell(j, i, this);
        } else {
          cells[i][j] = new Cell(j, i, this);
        }
      }
    }
  }

  void update() {
    for (int i = 0; i < lines; i++) {
      for (int j = 0; j < columns; j++) {
        cells[i][j].updateNeighbors();
      }
    }

    for (int i = 0; i < lines; i++) {
      for (int j = 0; j < columns; j++) {
        cells[i][j].getNextState();
      }
    }

    for (int i = 0; i < lines; i++) {
      for (int j = 0; j < columns; j++) {
        cells[i][j].updateState();
      }
    }
  }
}
