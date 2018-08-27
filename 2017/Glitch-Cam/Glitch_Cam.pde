import processing.video.*;

Capture cam;

int fWidth           =  1280;
int fHeight          =  720;

int gNum             =  50;

PImage img;

PImage[] imgG        = new PImage[gNum];
int[] xG             =  new int[gNum];
int[] yG             =  new int[gNum];
int[] wG             =  new int[gNum];
int[] hG             =  new int[gNum];

PFont font;

void settings(){
	size(fWidth, fHeight);

}

void setup(){
	pixelDensity(displayDensity());
	colorMode(HSB);

	String[] cameras = Capture.list();
  
	  if (cameras.length == 0) {
	    println("There are no cameras available for capture.");
	    exit();
	  } else {
	    println("Available cameras:");
	    for (int i = 0; i < cameras.length; i++) {
	      println(cameras[i]);
	   }

	   cam = new Capture(this, cameras[0]);
	   cam.start();
	}


	for (int i = 0; i < gNum; ++i) {
		xG[i] = int(random(fWidth));
		yG[i] = int(random(fHeight));
		wG[i] = int(random(fWidth/8,fWidth/4));
		hG[i] = int(random(fHeight/32,fHeight/16));
	}

}

void draw(){

	if (cam.available() == true) {
    	cam.read();
	}
	image(cam, 0, 0);
	fill(150, 10, 120, 80);
	rect(0, 0, width, height);

	for (int i = 0; i < gNum; ++i) {
		imgG[i] = get(xG[i], yG[i], wG[i], hG[i]);
		image(imgG[i], xG[i]+map(int(random(2)), 0, 2, -30, 30), yG[i]);
	}

}

void keyPressed(){

	if (key == 'c') {
		saveFrame("pic/pic-####.tif");
	}


}


