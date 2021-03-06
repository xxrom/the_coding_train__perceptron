Perceptron brain;

Point[] points = new Point[100];
CurrentLine currentLine;

int trainIndex = 0;

void setup() {
  size(800, 800);

  brain = new Perceptron();
  currentLine = new CurrentLine(
    brain.weights[0],
    brain.weights[1]
  );

  for (int i = 0; i < points.length; i++) {
    points[i] = new Point();
  }

  float[] inputs = { -1, 1 };

  int guess = brain.guess(inputs);
  println(guess);
}

void draw() {
  background(255);
  stroke(0);
  line(0, 0, width, height);
  currentLine.draw();

  for (Point pt : points) {
    pt.show();
  }

  for (int i = 0; i < points.length; i++) {
    Point pt = points[i];

    float[] inputs = { pt.x, pt.y };
    int target = pt.label;

    if (i == trainIndex) {
      brain.train(inputs, target);
      currentLine.calcNewB(
        brain.weights[0],
        brain.weights[1]
      );
    }

    int guess = brain.guess(inputs);
    if (guess == target) {
      fill(0, 250, 0);
    } else {
      fill(255, 0, 0);
    }
    noStroke();
    ellipse(pt.x, pt.y, 12, 12);
  }

  trainIndex++;
  if (trainIndex > points.length) {
    trainIndex = 0;
  }
}

void mousePressed() {
  for (Point pt : points) {
    float[] inputs = { pt.x, pt.y };
    int target = pt.label;
    brain.train(inputs, target);
  }
}