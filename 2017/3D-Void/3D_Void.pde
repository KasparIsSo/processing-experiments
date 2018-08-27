import peasy.*;

PeasyCam cam;

int fWidth                   =  800;
int fHeight                  =  800;

int points                   =  240;
int variations               =  20;

int spacing                  =  150;

float angle                  =  TWO_PI/points;

void settings() {
	size(fWidth, fHeight, P3D);
	pixelDensity(displayDensity());
}

void setup() {
	colorMode(HSB, 360, 100, 100);
	smooth();

	cam = new PeasyCam(this, width/2, height/2, 0, 3000);
	cam.setMinimumDistance(0);
	cam.setMaximumDistance(3000);
	
}

void draw() {
	translate(width/2, height/2);
	background(0);


	for (int v = 0; v < variations; ++v) {
		stroke(180, 20, v*5);
		for (int i = 0; i < points; ++i) {
			float xPos = sin(i*angle);
			float yPos = cos(i*angle);
			float r = 300 + 100 * noise(i * .5 + frameCount*.01 + v * 50);
			line(r * xPos, r * yPos, v * spacing, (r-150) * xPos, (r-150) * yPos, v* spacing);
		}
	}
}

void keyPressed() {

	if (key == 'c') {
		saveFrame("void/void-####.tif");
	}
}

