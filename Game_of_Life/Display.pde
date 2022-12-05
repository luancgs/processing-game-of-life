/* Display class
 
 universe: the universe instance to display
 cellSize: the size of each cell to be displayed
 aliveColor: color of alive cells
 deadColor: color of dead cells
 
 drawUniverse(): draws the current state of the universe on the screen
 
 **/

class Display {
  Universe universe;
  int cellSize;
  color aliveColor = color(0, 0, 0);
  color deadColor = color(255, 255, 255);

  Display(Universe uni) {
    universe = uni;
    cellSize = height/universe.lines;
  }

  void drawUniverse() {
    for (Cell[] line : universe.cells) {
      for (Cell cell : line) {
        if (cell.state == true) {
          fill(aliveColor);
        } else {
          fill(deadColor);
        }
        square(cell.column*cellSize, cell.line*cellSize, cellSize);
      }
    }

    for (int i = 0; i < universe.lines; i++) {
      line(0, i*cellSize, width, i*cellSize);
    }

    for (int i = 0; i < universe.columns; i++) {
      line(i*cellSize, 0, i*cellSize, height);
    }
  }
}
