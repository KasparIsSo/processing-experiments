int fWidth           =  800;
int fHeight          =  800;

int sections         =  1100;

float secAng         =  TWO_PI/sections;

float radius         =  250;

PFont aktiv;

void settings(){
	size(fWidth, fHeight, P3D);
}

void setup(){
	frameRate(30);
	aktiv = createFont("aktivBI.ttf", 56);
	textFont(aktiv);
	colorMode(HSB);
	background(108);

}

void draw(){
	// background(0, 200, 255);
	pushMatrix();
	fill(0, 10, 50);
	translate(0, 0, -500);
	box(2000, 2000, 1);
	popMatrix();
	directionalLight(0, 0, 125, 0, 0, -1);

	camera(0, 0, 800, 0, 0, 0, 0, 1.0, 0);
	
	pushMatrix();
	fill(255, 0, 255);
	text("Cool Text Area", -190, 10);
	popMatrix();

	
	noStroke();
	rotateZ(frameCount*TWO_PI/400);
	for (int i = 0; i < sections; ++i) {
		pushMatrix();
		// translate(radius*sin(i*secAng), radius*cos(i*secAng), 0); //170-300
		emissive(i%110 + 170, 100, 180);
		ambient(i%110 + 170, 100, 180);
		specular(i%110 + 170, 100, 200);
		fill(i%110 + 170, 255, 255);
		rotateZ(secAng*i);
		// translate(radius, 0, 100*sin((frameCount)*TWO_PI/100 + i*2));
		translate(radius+ 200*noise(frameCount*.01+i), 0, 0);
		// rotateX(frameCount*TWO_PI/100);
		rotateY((frameCount+i)*TWO_PI/255);
		box(20, 20, 150);
		popMatrix();
	}

}


