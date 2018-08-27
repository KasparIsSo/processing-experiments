int fWidth = 1280;
int fHeight = 720;

int scl = 20;
float inc = .1;

int cols = fWidth/scl;
int rows = fHeight/scl;

float zoff = 0;

ArrayList<Particle> ps = new ArrayList<Particle>();
int particleAmount = 3000;

PVector[] flowfield = new PVector[cols*rows];

void settings(){
  size(fWidth, fHeight, JAVA2D);
  
}

void setup() {
  pixelDensity(displayDensity());
  background(69, 104, 147);
  for (int i = 0; i < particleAmount; ++i) {
    ps.add(new Particle());
  }

}

void draw() {

 float yoff = 0;

   for (int y = 0; y < rows; ++y) {
    float xoff = 0;

     for (int x = 0; x < cols; ++x) {
      int index = y * cols + x;
      float r = noise(xoff, yoff, zoff);
      xoff += inc;
      PVector v = PVector.fromAngle(r * TWO_PI - PI/2);
      v.setMag(.01);
      flowfield[index] = v;
    } 

  yoff += inc;
  zoff += 0.0003;

 }

  for (int i = 0; i < particleAmount; ++i) {
    ps.get(i).edges();
    ps.get(i).follow(flowfield);
    ps.get(i).update();
    ps.get(i).display();

  }

}


class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  PVector previous;
  int maxSpeed;


  Particle() {
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
    position = new PVector(random(width), random(height));
    maxSpeed = 3;
    previous = position.copy();
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(maxSpeed);
    position.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    strokeWeight(1.5);
    stroke(255, 40);
    line(position.x, position.y, previous.x, previous.y);
    updatePrev();
  }

  void updatePrev() {
    previous.x = position.x;
    previous.y = position.y;
  }

  void edges() {
    if (position.x >= width) { 
      position.x = 0;
      updatePrev();
    }
    if (position.x < 0) { 
      position.x = width - 1;
      updatePrev();
    }
    if (position.y >= height) { 
      position.y = 0;
      updatePrev();
    }
    if (position.y < 0) { 
      position.y = height - 1;
      updatePrev();
    }
  }

  void follow(PVector[] vectors) {
    int x = floor(position.x / scl);
    int y = floor(position.y / scl);
    int index = y * cols + x;
    PVector force = vectors[index];
    applyForce(force);
  }

  void applyForce(PVector force){
    acceleration.add(force);
  }

}


