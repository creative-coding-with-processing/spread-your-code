void setup() {
  size(800, 800);
  smooth(8);
  stroke(#033649, 200);
  strokeWeight(1.6);
}

float sr_a = 6;
float sr_b = 17;
float sr_c = 18;
PVector StarRose(float t) {
  float f = (2+sin(sr_a*t)/2);
  float tt = t+sin(sr_b*t)/sr_c;
  return new PVector(f*cos(tt), f*sin(tt));
}

float time = 0;
void draw() {
  background(#E8DDCB);
  
  float st = sin(time/100.0);
 
  // update parametrization 
  sr_a = 100 * st * (noise(time/200.0, -time/100.0)-0.5);
  sr_b = 100 * st * (noise(4+time/200.0,1,time/100.0)-0.5);
  sr_c = 100 * st * (noise(3-time/200.0)-0.5);

  drawCurve();
  
  time++;
}

void drawCurve() {
  
  for (float r = 0; r<1; r+=0.05) {
    for (float t=0; t<TWO_PI; t+=TWO_PI/1500.0) {
      PVector sr = StarRose(t);
      sr.mult(r);

      float x = map(sr.x, -3, 3, 0, width);
      float y = map(sr.y, -3, 3, 0, height);

      point(x, y);
    }
  }
}

void keyPressed() {
  if(keyCode == 32) saveFrame("sr######.jpg");
}
