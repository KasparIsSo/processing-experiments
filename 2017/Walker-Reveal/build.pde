int fWidth                   =  1200;
int fHeight                  =  1200;

PVector[] direction;

int sects                    =  6;
float angle                  =  TWO_PI/sects;

ArrayList<Walker> walks      =  new ArrayList<Walker>();
int walkerAmount             =  50;

PImage img;

color[] imagePixels          =  new color[4 * fWidth * fHeight];

void settings() {
	size(fWidth, fHeight, P2D);
	pixelDensity(1);
}

void setup() {
	colorMode(HSB, 360, 100, 100);
	direction = new PVector[sects];
	for (int i = 0; i < direction.length; ++i) {
		direction[i] = new PVector(2 * sin(angle*i), 2 * cos(angle*i));
	}

	for (int i = 0; i < walkerAmount; ++i) {
		walks.add(new Walker());
	}

	img = loadImage("flower.png");
	image(img, 0, 0, 1200, 1200);
	loadPixels();

	arrayCopy(pixels, imagePixels);
	background(160, 10, 70);
}

void draw() {

	translate(width/2, height/2);

	for (int i = 0; i < walkerAmount; ++i) {
		walks.get(i).update();
		walks.get(i).display();
	}

	loadPixels();
	for (int i = 0; i < pixels.length; ++i) {
		if (saturation(pixels[i]) >= 11) {
			pixels[i] = imagePixels[i];
		}
	}
	updatePixels();
}

class Walker{
	PVector position;
	PVector velocity;
	PVector previous;
	int changer;
	int check;

	Walker() {
		position   =  new PVector(random(-20, 20), random(-20, 20));
		previous   =  position.copy();
		velocity   =  direction[(int)random(sects)];
		// previous   =  position.copy;
		check = (int)random(30, 100);
	}

	void update() {
		position   =  position.add(velocity);
		if (frameCount % check == 0) {
			this.changeV();
		}
	}

	void display() {
		stroke(200, 100, 80);
		strokeWeight(3);
		line(position.x, position.y, previous.x, previous.y);
		updatePrev();
	}

	void changeV() {
		PVector temp = direction[(int)random(sects)];
		PVector comp = new PVector(-1 * velocity.x, -1 * velocity.y);
		if (temp == comp){
			this.changeV();
		} else {
			velocity = temp;
		}
	}

	void updatePrev() {
		previous.x = position.x;
		previous.y = position.y;
	}

}

void keyPressed() {
	if (key == 'c'){
		for (int i = 0; i < walkerAmount; ++i) {
			walks.get(i).changeV();
		}
	} else if (key == 'r'){
		saveFrame("flower6/flower-####.tif");
	}
}