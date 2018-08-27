import controlP5.*;
import java.util.Calendar;

int pAmount     =  200;

ArrayList<Particle> particleList = new ArrayList<Particle>();

ControlP5 cp5;

Accordion accordion;

int particleAmountLol;

void settings(){
  fullScreen();
}

void setup() {
  pixelDensity(displayDensity());
  colorMode(HSB, 360, 100, 100, 100);
  background(0, 0, 100);

  for (int i = 0; i < pAmount; ++i) {
  	Particle p = new Particle();
  	particleList.add(p);
  }

  gui();
  smooth();

}

void gui() {

	cp5 = new ControlP5(this);

	Group g1 = cp5.addGroup("Particles")
				  .setBackgroundColor(color(0, 40))
				  .setBackgroundHeight(180)
				  .setColorForeground(color(180, 40, 80))
				  .setColorBackground(color(180, 20, 30))
				  ;

	cp5.addSlider("# of P")
	   .setPosition(30, 20)
	   .setColorActive(color(180, 40, 80))
	   .setColorForeground(color(180, 40, 50))
	   .setColorBackground(color(180, 20, 30))
	   .setSize(100, 20)
	   .setRange(50, 200)
	   .setValue(100)
	   .setNumberOfTickMarks(31)
	   .showTickMarks(false)
	   .moveTo(g1)
	   ;

	cp5.addSlider("P Speed")
	   .setPosition(30, 40)
	   .setColorActive(color(180, 40, 80))
	   .setColorForeground(color(180, 40, 50))
	   .setColorBackground(color(180, 20, 30))
	   .setSize(100, 20)
	   .setRange(0, 400)
	   .setValue(100)
	   .moveTo(g1)
	   ;

	cp5.addSlider("P Hue")
	   .setPosition(30, 60)
	   .setColorActive(color(180, 40, 80))
	   .setColorForeground(color(180, 40, 50))
	   .setColorBackground(color(180, 20, 30))
	   .setSize(100, 20)
	   .setRange(0, 360)
	   .setValue(60)
	   .moveTo(g1)
	   ;

  	cp5.addSlider("P Saturation")
	   .setPosition(30, 80)
	   .setColorActive(color(180, 40, 80))
	   .setColorForeground(color(180, 40, 50))
	   .setColorBackground(color(180, 20, 30))
	   .setSize(100, 20)
	   .setRange(0, 100)
	   .setValue(40)
	   .moveTo(g1)
	   ;

   cp5.addSlider("P Brightness")
	   .setPosition(30, 100)
	   .setColorActive(color(180, 40, 80))
	   .setColorForeground(color(180, 40, 50))
	   .setColorBackground(color(180, 20, 30))
	   .setSize(100, 20)
	   .setRange(0, 100)
	   .setValue(80)
	   .moveTo(g1)
	   ;

	cp5.addSlider("P Opacity")
	   .setPosition(30, 120)
	   .setColorActive(color(180, 40, 80))
	   .setColorForeground(color(180, 40, 50))
	   .setColorBackground(color(180, 20, 30))
	   .setSize(100, 20)
	   .setRange(0, 100)
	   .setValue(80)
	   .moveTo(g1)
	   ;

	cp5.addSlider("P Radius")
	   .setPosition(30, 140)
	   .setColorActive(color(180, 40, 80))
	   .setColorForeground(color(180, 40, 50))
	   .setColorBackground(color(180, 20, 30))
	   .setSize(100, 20)
	   .setRange(0, 10)
	   .setValue(4)
	   .setNumberOfTickMarks(11)
	   .showTickMarks(false)
	   .moveTo(g1)
	   ;

	Group g2 = cp5.addGroup("Background")
				  .setBackgroundColor(color(0, 40))
				  .setBackgroundHeight(100)
				  .setColorForeground(color(180, 40, 80))
				  .setColorBackground(color(180, 20, 30))
				  ;

	cp5.addSlider("BG Hue")
	   .setPosition(30, 20)
	   .setColorActive(color(180, 40, 80))
	   .setColorForeground(color(180, 40, 50))
	   .setColorBackground(color(180, 20, 30))
	   .setSize(100, 20)
	   .setRange(0, 360)
	   .setValue(0)
	   .moveTo(g2)
	   ;

	cp5.addSlider("BG Saturation")
	   .setPosition(30, 40)
	   .setColorActive(color(180, 40, 80))
	   .setColorForeground(color(180, 40, 50))
	   .setColorBackground(color(180, 20, 30))
	   .setSize(100, 20)
	   .setRange(0, 100)
	   .setValue(0)
	   .moveTo(g2)
	   ;

	cp5.addSlider("BG Brightness")
	   .setPosition(30, 60)
	   .setColorActive(color(180, 40, 80))
	   .setColorForeground(color(180, 40, 50))
	   .setColorBackground(color(180, 20, 30))
	   .setSize(100, 20)
	   .setRange(0, 100)
	   .setValue(100)
	   .moveTo(g2)
	   ;


	Group g3 = cp5.addGroup("Triangles")
				  .setBackgroundColor(color(0, 40))
				  .setBackgroundHeight(140)
				  .setColorForeground(color(180, 40, 80))
				  .setColorBackground(color(180, 20, 30))
				  ;

	cp5.addSlider("T Allowance")
	   .setPosition(30, 20)
	   .setColorActive(color(180, 40, 80))
	   .setColorForeground(color(180, 40, 50))
	   .setColorBackground(color(180, 20, 30))
	   .setSize(100, 20)
	   .setRange(0, 200)
	   .setValue(100)
	   .moveTo(g3)
	   ;

	cp5.addSlider("T Hue")
	   .setPosition(30, 40)
	   .setColorActive(color(180, 40, 80))
	   .setColorForeground(color(180, 40, 50))
	   .setColorBackground(color(180, 20, 30))
	   .setSize(100, 20)
	   .setRange(0, 360)
	   .setValue(180)
	   .moveTo(g3)
	   ;

    cp5.addSlider("T Saturation")
	   .setPosition(30, 60)
	   .setColorActive(color(180, 40, 80))
	   .setColorForeground(color(180, 40, 50))
	   .setColorBackground(color(180, 20, 30))
	   .setSize(100, 20)
	   .setRange(0, 100)
	   .setValue(60)
	   .moveTo(g3)
	   ;

    cp5.addSlider("T Brightness")
	   .setPosition(30, 80)
	   .setColorActive(color(180, 40, 80))
	   .setColorForeground(color(180, 40, 50))
	   .setColorBackground(color(180, 20, 30))
	   .setSize(100, 20)
	   .setRange(0, 100)
	   .setValue(60)
	   .moveTo(g3)
	   ;

	cp5.addSlider("T Opacity")
	   .setPosition(30, 100)
	   .setColorActive(color(180, 40, 80))
	   .setColorForeground(color(180, 40, 50))
	   .setColorBackground(color(180, 20, 30))
	   .setSize(100, 20)
	   .setRange(0, 100)
	   .setValue(10)
	   .moveTo(g3)
	   ;

	Group g4 = cp5.addGroup("Take a Screenshot")
				  .setBackgroundColor(color(0, 40))
				  .setBackgroundHeight(80)
				  .setColorForeground(color(180, 40, 80))
				  .setColorBackground(color(180, 20, 30))
				  ;

	cp5.addButton("Save")
	   .setPosition(30, 20)
	   .setColorForeground(color(180, 40, 80))
	   .setColorBackground(color(180, 40, 50))
	   .setSize(140, 40)
	   .moveTo(g4)
	   ;


	accordion = cp5.addAccordion("acc")
				   .setPosition(width-200, 0)
				   .setWidth(200)
				   .addItem(g1)
				   .addItem(g2)
				   .addItem(g3)
				   .addItem(g4)
				   ;

  cp5.mapKeyFor(new ControlKey() {public void keyEvent() {accordion.open(0, 1, 2, 3);}}, 'o');
  cp5.mapKeyFor(new ControlKey() {public void keyEvent() {accordion.close(0, 1, 2, 3);}}, 'p');

  accordion.open(0, 1, 2, 3);
  accordion.setCollapseMode(Accordion.MULTI);



}

void draw() {
	float bgH = cp5.getController("BG Hue").getValue();
	float bgS = cp5.getController("BG Saturation").getValue();
	float bgB = cp5.getController("BG Brightness").getValue();
	background(bgH, bgS, bgB);

	float ptcl = cp5.getController("# of P").getValue();
	float allo = cp5.getController("T Allowance").getValue();
	float tH = cp5.getController("T Hue").getValue();
	float tS = cp5.getController("T Saturation").getValue();
	float tB = cp5.getController("T Brightness").getValue();
	float tO = cp5.getController("T Opacity").getValue();

	float pH = cp5.getController("P Hue").getValue();
	float pS = cp5.getController("P Saturation").getValue();
	float pB = cp5.getController("P Brightness").getValue();
	float pO = cp5.getController("P Opacity").getValue();
	float pR = cp5.getController("P Radius").getValue();

	for (int i = 0; i < ptcl; ++i) {

		particleList.get(i).update();
		particleList.get(i).display(pH, pS, pB, pO, pR);

		for (int j = 0; j < ptcl-1; ++j) {
			if (j != i){
			float distT1 = dist(particleList.get(i).position.x, 
								particleList.get(i).position.y, 
								particleList.get(j).position.x, 
								particleList.get(j).position.y);
			if (distT1 <= allo){
				for (int k = 0; k < ptcl-2; ++k) {
					if (k != i || k!=j){
						float distT2 = dist(particleList.get(j).position.x, 
											particleList.get(j).position.y, 
											particleList.get(k).position.x, 
											particleList.get(k).position.y);

						float distT3 = dist(particleList.get(k).position.x, 
											particleList.get(k).position.y, 
											particleList.get(i).position.x, 
											particleList.get(i).position.y);

						if (distT2 <= allo && distT3 <=allo){
							noStroke();
							fill(tH, tS, tB, tO);
							beginShape();
							vertex(particleList.get(i).position.x,
								   particleList.get(i).position.y);
							vertex(particleList.get(j).position.x,
								   particleList.get(j).position.y);
							vertex(particleList.get(k).position.x,
								   particleList.get(k).position.y);	
							endShape(CLOSE);					}
						}
					}
				}
			}
		}

	}
}

public void controlEvent(ControlEvent theEvent) {
  println(theEvent.getController().getName());
}

public void Save(ControlEvent theEvent) {
  saveFrame("screenshots/" + timestamp()+"_####.png");
}


String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty_%1$tm_%1$td", now);
}