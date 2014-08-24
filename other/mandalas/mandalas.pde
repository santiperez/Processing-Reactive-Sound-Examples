int counter;

color[] colors1={#5ba087,#c4d69c,#8eba8e,#cb6143,#8eba8e,#f6f0a0,#cb6143};
color[] colors2={#c74c6b,#d8ccca, #d07274, #c74c6b, #3d3d3d, #dc9f9a, #c74c6b};
color[] colors3={#6b8d36, #afc65f, #d2e2cd, #8eba8e, #d2e2cd, #6ab0b4, #f1e670};
color[] colors4={#6b8d36, #afc65f, #d2e2cd, #8eba8e, #d2e2cd, #6ab0b4, #f1e670};
color[] colors5={#ca5d1f,#e6b556,#a17125,#cb6143,#a3cab5,#f6f0a0,#e6b556};
color[] colors6={#d2d0bc,#a4ada6,#457a9b,#a4ada6,#d2d0bc,#ede4d7,#c35b41};
color[] colors7= {color(255,0,0),color(0,255,0),color(0,0,255)};

void setup(){
size(800, 640);
}

void draw()
{
   background(100);
  
  mandala(width/4, height/4,13,12,width*0.2,0.9,0.1,colors1);
  
  mandala(width/2, height/2,29,25,width*0.2,0.5,-0.5,colors2);
  
  mandala(width*0.8, height/4,19,10,width*0.2,0.5,-0.5,colors3);
  
  mandala(width*0.55, height/6.5,7,13,width*0.12,0.7,-0.5,colors4);
  
  mandala(0.8*width, height*0.75,13,100,width*0.2,0.7,-0.5,colors7);
  
  mandala(0.2*width, height*0.75,13,65,width*0.2,0.9,-0.5,colors5);
  
  mandala(0.5*width, height*0.85,25,18,width*0.13,0.7,-0.5,colors6);
  
  counter=(counter+1)%3600;
}


void mandala(float centerX, float centerY, int steps, int pointCount, float outerRadius,float innerRadiusFactor, float degrees, color[] colors)
{
  translate(centerX,centerY);
  
  float innerRadius = outerRadius*innerRadiusFactor;
  float outerRadiusRatio = outerRadius/steps;
  float innerRadiusRatio = innerRadius/steps;
  float shadeRatio = 255.0/steps;
  float rotationRatio = 45.0/steps;
  
  int colorStep=(steps/colors.length)+1;
  int colorCounter=0;
  
  
  for (int i=0; i<steps; i++) 
  {
  stroke(255-shadeRatio*i, 100);
  //fill(shadeRatio*i,0,0);

  //color c=lerpColor(color(255,0,0), color(0,255,0), (float)i/steps);
  color c=colors[i%colors.length];
  fill(c);
  pushMatrix();
  rotate((rotationRatio*i*PI/180)+radians(degrees*counter));
  star(pointCount, outerRadius-outerRadiusRatio*i, innerRadius-innerRadiusRatio*i);
  popMatrix();
  }
  translate(-centerX,-centerY);  
}

void drawCircle(int x, int y, int s) 
{
  if (s>2) {
  ellipse(x, y, s, s);
  }
}
void star(int pointCount, float innerRadius, float outerRadius) 
{
  //
  float theta = 0.0;
  // point count is 1/2 of total vertex count
  int vertCount = pointCount*2;
  float thetaRot = TWO_PI/vertCount;
  float tempRadius = 0.0;
  float x = 0.0, y = 0.0;
  beginShape();
  for (int i=0; i<pointCount; i++) 
  {
    for (int j=0; j<2; j++)
    {
    tempRadius = innerRadius;
    // true if j is even
    if (j%2==0)
    {
      tempRadius = outerRadius;
    }
    x = cos(theta)*tempRadius;
    y = sin(theta)*tempRadius;
    vertex(x, y);
    theta += thetaRot;
    }
  }
  endShape(CLOSE);
} //
