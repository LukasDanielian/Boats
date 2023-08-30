float[][] pond;
float scale = 25;
float theta;
ArrayList<Boat> boats;
float amplitude;

void setup()
{
  fullScreen(P3D);
  shapeMode(CENTER);
  rectMode(CENTER);
  textAlign(CENTER,CENTER);
  noStroke();
  textSize(128);
  
  pond = new float[int(width/scale) * 2][int(width/scale) * 2];
  boats = new ArrayList<Boat>();
  amplitude = 25;
  
  for(int i = 0; i < 10; i++)
    boats.add(new Boat());
}

void draw()
{
  background(#147DB4);
  textSize(128);
  lights();
  camera(width/2, height * .9,0,   width/2,height,-pond.length/2 * scale,  0,1,0);
  
  for(int row = 0; row < pond.length; row++)
  {
    for(int col = 0; col < pond.length; col++)
    {
      float dist = dist(row,col,pond.length/2,pond.length/2);
      float waveHeight = sin(dist/4 + theta) * amplitude;

      pond[row][col] = waveHeight;
    }
  }
  
  pushMatrix();
  translate(width/2 - pond.length/2 * scale,height,0);
  noStroke();
  for (int z = 0; z < pond.length-1; z++)
  {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < pond.length; x++)
    {
      fill(0,0,map(pond[x][z],-amplitude,amplitude,255,75));
      vertex(x * scale, pond[x][z],z * -scale);
      vertex(x * scale, pond[x][z+1],(z+1) * -scale);
    }
    endShape();
  }
  
  pushMatrix();
  translate(pond.length/2 * scale,0,-pond.length/2 * scale);
  for(int i = 0; i < boats.size(); i++)
    boats.get(i).render();
  popMatrix();
  popMatrix();
  
  theta -= .05;
}
