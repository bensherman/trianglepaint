Tint myTint = new Tint();

void setup() {
  colorMode(HSB, 100);
  frame.setResizable(true);
  size(500, 500);
  background(50,50,50);
  frameRate(30);
}

void draw() {
  int triangleSize=height/10;
  int x = 0;
  int y = 0;
  noStroke();
  for (int i=0; i < width + triangleSize; i += triangleSize) {
    for (int j=0; j < height + triangleSize; j += triangleSize) {
      int ax = x;
      int ay = y + triangleSize;
      int bx = x + triangleSize; 
      int by = y + triangleSize;
      int cx = x + triangleSize/2;
      int cy = y;
      triangleFill(ax, ay, bx, by, cx, cy);
      triangle(ax, ay, bx, by, cx, cy);
      ax = x;
      ay = y + triangleSize;
      bx = x - triangleSize / 2; 
      by = y;
      cx = x + triangleSize/2;
      cy = y;
      triangleFill(ax, ay, bx, by, cx, cy);
      triangle(ax, ay, bx, by, cx, cy);
      y += triangleSize;
    }
    y = 0;
    x += triangleSize;
  }
}

void keyPressed() {
  if (key == 'q' || key == 'Q') {
    myTint.moreHue();
  } else if (key == 'a' || key == 'A') {
    myTint.lessHue();
  } else if (key == 'w' || key == 'W') {
    myTint.moreSaturation();
  } else if (key == 's' || key == 'S') {
    myTint.lessSaturation();
  } else if (key == 'e' || key == 'E') {
    myTint.brighter();
  } else if (key == 'd' || key == 'D') {
    myTint.darker();
  }
  println("tint: ", myTint.hueDelta, myTint.saturationDelta, myTint.brightnessDelta);
}

void triangleFill(int ax, int ay, int bx, int by, int cx, int cy) {
  color myFillColor = get(mouseX, mouseY);
  if (mousePressed && insideTriangle(ax, ay, bx, by, cx, cy, mouseX, mouseY) &&
    (mouseX < width) && (mouseX > 0) &&
    (mouseY < height) && (mouseY > 0)) {
    if (mouseButton == LEFT) {
      myFillColor = myTint.more(myFillColor);
    } else if (mouseButton == RIGHT) {
      myFillColor = myTint.less(myFillColor);
    }
    fill(myFillColor);
  } else {
    noFill();
  }
}

boolean insideTriangle(int ax, int ay, int bx, int by, int cx, int cy, int x, int y) {
  /* figure out if a point is inside of a triangle.
   make a triangle out each of the vertexes and the x,y of the point to be discovered.  
   sum area.  if equal to area of main triangle, point is inside.  if greater, it is not.
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

