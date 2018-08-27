import peasy.*;

PeasyCam cam;

int fWidth                   =  800;
int fHeight                  =  800;

float r                      =  300;

float s                      =  0;
float t                      =  0;

ArrayList<PVector> points = new ArrayList<PVector>();

void settings() {
	size(fWidth, fHeight, P3D);
	pixelDensity(displayDensity());
}

void setup() {
	background(40);
	colorMode(HSB, 360, 100, 100);
	smooth();

	cam = new PeasyCam(this, width/2, height/2, 0, 1500);
	cam.setMinimumDistance(0);
	cam.setMaximumDistance(3000);
	
}

void draw() {
	translate(width/2, height/2);
	background(70);
	stroke(20);
	strokeWeight(1);
	rotateZ(frameCount*.01);

	if (points.size() < 960) {
		s = frameCount * .1;
		t = frameCount * .01;

		points.add(new PVector(r * cos(s) * sin(t), r * sin(s) * sin(t), r * cos(t)));
	}
	for (int i = 0; i < points.size()/3; ++i) {
		if (i > 0){
			stroke(i%360, 50, 50);
			line(points.get(i).x, points.get(i).y, points.get(i).z, points.get(i-1).x, points.get(i-1).y, points.get(i-1).z);
		}

		if (i > 50){
			stroke(i%360, 50, 50);
			line(points.get(i).x, points.get(i).y, points.get(i).z, points.get(i-50).x, points.get(i-50).y, points.get(i-50).z);
		}
	}

}

void keyPressed() {

	if (key == 'c') {
		saveFrame("lantern/lantern-####.png");
	}
}

