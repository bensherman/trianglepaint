Tint myTint = new Tint();

void setup() {
  size(950, 1000);
  background(255);
  frameRate(60);
}

void draw() {
  int triangleSize=height/10;
  int x = 0;
  int y = 0;
  noStroke();
  for (int i=0; i < width; i += triangleSize) {
    for (int j=0; j < height; j += triangleSize) {
      int ax = x;
      int ay = y + triangleSize;
      int bx = x + triangleSize; 
      int by = y + triangleSize;
      int cx = x + triangleSize/2;
      int cy = y;
      if (mousePressed && insideTriangle(ax, ay, bx, by, cx, cy, mouseX, mouseY)) {
        fill(triangleFill());
      } else {
        noFill();
      }
      triangle(ax, ay, bx, by, cx, cy);
      ax = x;
      ay = y + triangleSize;
      bx = x - triangleSize / 2; 
      by = y;
      cx = x + triangleSize/2;
      cy = y;
      if (mousePressed && insideTriangle(ax, ay, bx, by, cx, cy, mouseX, mouseY)) {
        fill(triangleFill());
      } else {
        noFill();
      }
      triangle(ax, ay, bx, by, cx, cy);
      y += triangleSize;
    }
    y = 0;
    x += triangleSize;
  }
}

void keyPressed() {
  if (key == 'q' || key == 'Q') {
    myTint.moreRed();
  } else if (key == 'a' || key == 'A') {
    myTint.lessRed();
  } else if (key == 'w' || key == 'W') {
    myTint.moreGreen();
  } else if (key == 's' || key == 'S') {
    myTint.lessGreen();
  } else if (key == 'e' || key == 'E') {
    myTint.moreBlue();
  } else if (key == 'd' || key == 'D') {
    myTint.lessBlue();
  } 
  println ("tint: ", myTint.r, myTint.g, myTint.b);
}

color triangleFill() {
  color fillColor = get(mouseX, mouseY);
  if (mouseButton == RIGHT) {
    fillColor = myTint.addTint(fillColor);
  } else if (mouseButton == LEFT) {
    fillColor = myTint.removeTint(fillColor);
  }
  return fillColor;
}

boolean insideTriangle(int ax, int ay, int bx, int by, int cx, int cy, int x, int y) {
  /* figure out if a point is inside of a triangle.
   make a triangle out each of the vertexes and the x,y 
   of the point to be diescovered.  sum area.  if equal, 
   point is inside.  if greater, it is not.
   */
  float total = triangleArea(ax, ay, bx, by, cx, cy);
  float ta = triangleArea(x, y, bx, by, cx, cy);
  float tb = triangleArea(ax, ay, x, y, cx, cy);
  float tc = triangleArea(ax, ay, bx, by, x, y);
  return (ta + tb + tc == total);
}

float triangleArea(int ax, int ay, int bx, int by, int cx, int cy) {
  int ta = ax - cx;
  int tb = ay - cy;
  int tc = bx - cx;
  int td = by - cy;
  float area = (.5 * (abs((ta*td) - (tb*tc))));
  return area;
}

