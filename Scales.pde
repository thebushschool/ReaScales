// global variables
int rows = 8;
int cols = 8;
int mult = 100;  //  pixel coordinate scale for x and y
int off = 50;    // offset between rows and cols
float wid = 50;  // width of shape
float hgt = 50;  // height of shape
float inc = 0.8;   // amount of inc for each frame
float min = 30;    // min size when breathing
float max = 100;    //  max size when breathing
boolean grow = true;  // breathe in first!
float r, g, b, a;  //red, green, blue, alpha

void mouseClicked() {
  r = (int)(Math.random()*256);
  g = (int)(Math.random()*256);
  b = (int)(Math.random()*256);
}

void setup() {
  windowResize(cols * mult, rows * mult);
  r = (int)(Math.random()*256);
  g = (int)(Math.random()*256);
  b = (int)(Math.random()*256);
  a = 200;
  noStroke();
  ellipseMode(CENTER);
}

void draw() {
  background(145);
  for (int x = 0; x < cols; x++) {    // x coordinate for rows loop
    for (int y = 0; y < rows; y++) {  // y coordinate for cols loop
      // scale(x * 50 + off, y * 50 + off);  // draw shapes in rows and cols
      scale(x, y);
    }
  }
incr_size_color();

  if (wid >= max||wid <= min) {   // toggle phases
   if (!grow) {
        r = (int) (Math.random()*256);
        g = (int) (Math.random()*256);
        b = (int) (Math.random()*256);
      }
      grow = !grow;
    }
}

void incr_size_color() {
  if (grow) {     // grow phase
    wid += inc;
    hgt += inc;
  } else {        // shrink phase
    wid -= inc;
    hgt -= inc;
  }
}

void scale(int x, int y) {
  int tempx = x * mult + off;
  int tempy = y * mult + off;
  fill(r, g, b, a);
  //triangle(x + 25, y + 25, x - 25, y + 25, x, y - 50);
  // ellipse(x, y + 25, 50, 50);
  triangle(tempx - wid/2, tempy - hgt/7, tempx + wid/2, tempy - hgt/7, tempx, tempy - hgt);
  ellipse(tempx, tempy, wid, hgt);
}
