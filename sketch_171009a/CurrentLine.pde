float calcB(float w0, float w1) {
  return -w0 / w1;
}

class CurrentLine {
  float b = 0;

  CurrentLine(float w0, float w1) {
    b = calcB(w0, w1);
  }

  void calcNewB(float w0, float w1) {
    b = calcB(w0, w1);
  }

  void draw() {
    float y0 = -1000;
    float x0 = y0 / b;
    float y1 = 1000;
    float x1 = y1 / b;

    stroke(204, 102, 0);
    line(x0, y0, x1, y1);
  }
}