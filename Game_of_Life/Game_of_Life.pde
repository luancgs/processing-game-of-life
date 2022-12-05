Universe universe;
Display display;

void setup() {
  size(1500, 1000);
  universe = new Universe(150, 100);
  display = new Display(universe);
}

void draw() {
  background(220);
  display.drawUniverse();
  universe.update();
}
