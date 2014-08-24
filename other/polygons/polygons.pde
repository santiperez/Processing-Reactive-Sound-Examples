void setup()
{
  size(400,400);
  background(255);
  fill(100);
  
  for(int i=0;i<300;i++)
  {
    polygon(random(width),random(height),(int)random(3,15),random(2,20),random(TWO_PI));
  }
  
}

void polygon(float xCenter,float yCenter,int side, float radius, float rotation)
{
  pushMatrix();
  translate(xCenter,yCenter);
  rotate(rotation);
   
  float theta=0;
  float x=0;
  float y=0;
 
  beginShape();
  for(int i=0;i<side;i++)
  {
    x=cos(theta)*radius;
    y=sin(theta)*radius;
    vertex(x,y);
   theta+=TWO_PI/side;
  }
  endShape(CLOSE);
  popMatrix();
}


