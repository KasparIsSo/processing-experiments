import processing.pdf.*;

int w = 600;
int h = 600;

int dispDens;

int tile = 120;

int r = 1;

int col = ceil(w / tile);
int row = ceil(h / tile);

PVector[][] noise = new PVector[row][col];
// float noiseStep = .25;
float noiseStep = 1.35;

ArrayList<Particle> particles = new ArrayList<Particle>();
int pAmount = 1000;

color def;
boolean record;

PImage[] shifter = new PImage[row*col];

void settings() {
  size(w, h, P2D);
  dispDens = displayDensity();
  pixelDensity(dispDens);

  // pixelDensity(1);
}

void setup() {
  colorMode(HSB, 360, 100, 100);
  noiseSeed(3);
  randomSeed(0);

  noiseField(noise);

  for(int i = 0; i < pAmount; i++) {
    particles.add(new Particle());
  }
  // background(0, 0, 100);
  background(240, 100, 100);

  // def = color(0, 0, 20);
  def = color(0, 0, 100);

  textAlign(CENTER);

  for(int j = 0; j < noise.length; j++) {
    for(int i = 0; i < noise[0].length; i++) {
      pushMatrix();
      translate(i * tile, j * tile);
      line(0, 0, noise[j][i].x*50, noise[j][i].y*50);
      fill(def);
      text(str(round(noise[j][i].x * 10000)), tile/2, tile/2 - 10);
      text(str(round(noise[j][i].y * 10000)), tile/2, tile/2 + 10);
      popMatrix();
    }
  }

  // beginRecord(PDF, "pdf/grids-####.pdf");
}

void draw() {

  // if(record) {
  //   beginRecord(PDF, "pdf/grids-####.pdf");
  // }

  // for (int y = 0; y < row; y++) {
  //   for (int x = 0; x < col; x++) {
  //     fill(0, 0, 0);
  //     if (y % 2 == 0 && x % 2 == 0) {
  //       fill(0, 0, 100);
  //     }
  //     pushMatrix();
  //     translate(x * tile, y * tile);
  //     rect(0, 0, tile, tile);
  //     popMatrix();
  //   }
  // }

  for(int i = 0; i < particles.size(); i++) {
    Particle p = particles.get(i);
    p.display();
    if(p.edgeKill()) {
      particles.remove(i);
    };
  }

  if(record) {
    endRecord();
    record = false;
  }

}

void noiseField(PVector[][] nField) {
  for(int j = 0; j < nField.length; j++) {
    for(int i = 0; i < nField[0].length; i++) {
      PVector pv = PVector.fromAngle(1.7 * TWO_PI * noise(j*noiseStep, i*noiseStep));
      // pv.x += i*.01;
      // pv.y += j*.01;
      // nField[j][i] = pv;

      float tX = ((float(i) + .5) / col);
      float tY = ((float(j) + .5) / row);

      PVector temp = new PVector(tX, tY);

      // pv.setMag(temp.mag() * .15);
      pv.setMag(.2);

      // float tX = ((float(i) + .5) / col) * .8;
      // float tY = ((float(j) + .5) / row) * .8;

      // println(tX);
      pv.x += (tX * 1);
      pv.y += (tY * 1);

      pv.setMag(.03);
      // PVector pv = new PVector(tX, tY);

      // PVector pv = new PVector((1 + j)/col, (1 + i)/row);
      // pv.x += i*.01;
      // pv.y += j*.01;
      nField[j][i] = pv;
    }
  }
}

class Particle {
  PVector pos, vel;
  Particle() {
    int d = round(random(0, 1));
    if(d == 0) {
      pos = new PVector(0, random(0, tile * 2));
    } else {
      pos = new PVector(random(0, tile * 2), 0);
    }
    // vel = PVector.fromAngle(random(TWO_PI));
    vel = new PVector(0, 0);
  }

  void display() {
    pushMatrix();
    noStroke();
    fill(def);
    ellipse(pos.x, pos.y, r, r);
    popMatrix();
    update();
  }

  void update() {
    int gX = floor(pos.x / tile);
    int gY = floor(pos.y / tile);
    vel.add(noise[gY][gX]);
    vel.setMag(1);
    pos.add(vel);
    // pos.add(noise[gY][gX].setMag(1));
  }

  boolean edgeKill() {
    if (pos.x > w || pos.x < 0) {
      return true;
    } else if (pos.y > h || pos.y < 0) {
      return true;
    } else {
      return false;
    }
  }
}

void keyPressed() {
  if(key == 'q') {
    // loadPixels();
    for(int y = 0; y < row; y++) {
      for(int x = 0; x < col; x++) {
        pushMatrix();
        int shiftPos = y * col + x;
        // shifter[shiftPos] = get(x * tile, y * tile, tile, tile);
        // PImage tImg = createImage(tile, tile, RGB);
        shifter[shiftPos] = createImage(tile * dispDens, tile * dispDens, RGB);
        shifter[shiftPos].loadPixels();

        for(int i = 0; i < shifter[shiftPos].pixels.length; i++) {
          shifter[shiftPos].pixels[i] = get(i%(tile*dispDens) + x*tile*dispDens, floor(i/(tile*dispDens)) + y*tile*dispDens);
        }
        shifter[shiftPos].updatePixels();
        // shifter[shiftPos] = tImg;
        popMatrix();
      }
    }
  }

  if(key == 'r') {
    background(0, 0, 100);
    for(int y = 0; y < row; y++) {
      for(int x = 0; x < col; x++) {
        pushMatrix();
        translate(x*tile, y*tile);
        int idx = floor(random(shifter.length));
        // println(shifter.length);
        // println(idx);
        image(shifter[idx], 0, 0, tile, tile);
        // fill(def);
        // rect(0, 0, tile, tile);
        popMatrix();
      }
    }
  }

  if(key == 'c') {
    record = true;
  }
}
