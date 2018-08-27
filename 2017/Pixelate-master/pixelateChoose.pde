int fWidth               =  800;
int fHeight              =  800;

float zoom               =  0;

PImage img;

int tileSize             =  10;

int rows                 =  fHeight/tileSize;
int cols                 =  fWidth/tileSize;

boolean[][] showPixel    =  new boolean[cols][rows];
boolean[][] beenClicked  =  new boolean[cols][rows];

boolean record;

void settings() {
	size(fWidth, fHeight);
}

void setup() {
	img = loadImage("jordanCrying.jpg");
	colorMode(HSB);
}

void draw() {
	image(img, 0 - zoom, 0 - zoom, width + zoom * 2, height + zoom * 2);

	// zoom = mouseX - width/2;
	// if (zoom > -400){
	// 	zoom -= .5;
	// }

	for(int y = 0; y < rows; y++) {
		for(int x = 0; x < cols; x++) {
			if (showPixel[x][y] == true) {
				int gridX = int(x*tileSize + .5*tileSize);
				int gridY = int(y*tileSize + .5*tileSize);
				color c = get(gridX, gridY);
				noStroke();
				fill(hue(c), 
					saturation(c) - 10, 
					brightness(c) + map(noise(frameCount * .1 + y*x + x), 0, 1, -40, 50)
				);
				rect(x*tileSize, y*tileSize, tileSize, tileSize);
			}
		}
	}
	if (record == true){
		saveFrame("jordan/crying-####.png");
	}

}

void keyPressed() {
	// if (key == 'c') {
	// 	saveFrame("jordan/crying-####.png");
	// }

	if (key == 'r') {
		if (!record){
			record = true;
		} else {
			record = false;
		}
	}
}

void mousePressed() {
	int tempX = floor(mouseX / tileSize);
	int tempY = floor(mouseY / tileSize);

	if (!beenClicked[tempX][tempY]) {
		showPixel[tempX][tempY] = !showPixel[tempX][tempY];
		beenClicked[tempX][tempY] = true;
	}

}

void mouseDragged() {
	int tempX = floor(mouseX / tileSize);
	int tempY = floor(mouseY / tileSize);

	if (beenClicked[tempX][tempY] == false) {
		showPixel[tempX][tempY] = !showPixel[tempX][tempY];
		beenClicked[tempX][tempY] = true;
	}
}

void mouseReleased() {
	for(int y = 0; y < rows; y++) {
		for(int x = 0; x < cols; x++) {
			beenClicked[x][y] = false;
		}
	}
}


