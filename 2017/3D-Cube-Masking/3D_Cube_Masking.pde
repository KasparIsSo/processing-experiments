int fWidth           =  800;
int fHeight          =  800;

int secs             =  50;

int secX             =  fWidth/secs;
int secY             =  fHeight/secs;

color[] fill         =  new color[fWidth * fHeight];

void settings(){
	size(fWidth, fHeight, P3D);
	pixelDensity(1);

}

void setup(){
	colorMode(HSB);

}

void draw(){
	randomSeed(0);
	background(255);
	noStroke();
	fill(150, 100, 100);
	for (int y = 0; y < secY + 1; ++y) {
		for (int x = 0; x < secX + 1; ++x) {
			ellipse( x * secs, y * secs, map(sin(frameCount*.1), -1, 1, 55, 65), map(sin(frameCount*.1), -1, 1, 55, 65));
		}
	}
	loadPixels();
	arrayCopy(pixels, fill);

	background(214);
	
	for (int i = 0; i < 15; ++i) {
		pushMatrix();	
		translate(random(width), random(height), 0);
		rotateY(frameCount * .01);

		pushMatrix();
		rotateX(PI / 4);
		rotateZ(PI / 4);
		strokeWeight(2);
		stroke(214);
		color fc = color (255, 0, 255);
		fill(fc);
		box(random(50, 200));
		popMatrix();
		popMatrix();
	}

	loadPixels();

	for (int i = 0; i < pixels.length; ++i) {

			if (saturation(pixels[i]) == 0 && brightness(pixels[i]) == 255){
				pixels[i] = fill[i];
			}
	}

	updatePixels();
}


void keyPressed(){
	if (key == 'r') {
		redraw();
	}

}

