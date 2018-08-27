class Particle {
	PVector position;
	PVector velocity;
	float r;
	float velMag;
	float pastVelMag;

	Particle() {
		position = new PVector(random(width), random(height));
		float angle = random(TWO_PI);
		velocity = new PVector(sin(angle), cos(angle));
		velMag = 100;
		r = 2;
	}

	void display(float hP, float sP, float bP, float oP, float rP) {
		noStroke();
		fill(hP, sP, bP, oP);
		ellipse(position.x, position.y, rP, rP);
	}

	void update() {
		this.edge();
		float tempVel = cp5.getController("P Speed").getValue();
		if (tempVel != pastVelMag){
			velMag = tempVel * .01;
		};
		position.x += velMag * velocity.x;
		position.y += velMag * velocity.y;
		pastVelMag = velMag;
	}

	void edge() {
		if(position.x >= width){
			velocity.x = -1 * velocity.x;
		}
		if(position.x <= 0){
			velocity.x = -1 * velocity.x;
		}
		if(position.y >= height){
			velocity.y = -1 * velocity.y;
		}
		if(position.y <= 0){
			velocity.y = -1 * velocity.y;
		}
	}

}