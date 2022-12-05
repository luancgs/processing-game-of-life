/* Cell class
 
 state: if the cell is alive (true) or dead (false)
 nextState: the next state of the cell after calculating
 column: the column this cell belongs to in the universe matrix
 line: the line this cell belongs to in the universe matrix
 neighbors: array of neighbors of this cell
 universe: the universe this cell belongs to
 
 updateNeighbors(): updates the current state of neighbors
 getNextState(): calculates next state according to the rules of the game of life
 updateState(): updates current state to next state
 
 **/

class Cell {
  boolean state;
  boolean nextState;
  int column;
  int line;
  Cell[] neighbors;
  Universe universe;

  Cell(int col, int lin, Universe uni) {
    state = random(1) > 0.5 ? true : false;
    column = col;
    line = lin;
    universe = uni;
    neighbors = new Cell[8];
  }

  void updateNeighbors() {
    neighbors[0] = universe.cells[line-1][column-1];
    neighbors[1] = universe.cells[line-1][column];
    neighbors[2] = universe.cells[line-1][column+1];
    neighbors[3] = universe.cells[line][column-1];
    neighbors[4] = universe.cells[line][column+1];
    neighbors[5] = universe.cells[line+1][column-1];
    neighbors[6] = universe.cells[line+1][column];
    neighbors[7] = universe.cells[line+1][column+1];
  }

  void getNextState() {
    int countAlive = 0;

    for (Cell neighbor : neighbors) {
      if (neighbor.state == true) countAlive++;
    }

    if (state == true) {
      if (countAlive >= 2 && countAlive <= 3) {
        nextState = true;
      } else {
        nextState = false;
      }
    } else {
      if (countAlive == 3) {
        nextState = true;
      } else {
        nextState = false;
      }
    }
  }

  void updateState() {
    state = nextState;
  }
}
