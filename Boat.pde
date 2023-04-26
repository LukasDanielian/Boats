class Boat
{
  PVector pos;
  float dist, bTheta, thetaChanger;
  
  public Boat()
  {
    dist = random(250,(pond.length/2) * scale);
    pos = new PVector(0,0,0);
    thetaChanger = random(-.01,.01);
  }
  
  void render()
  {
    pos.x = sin(bTheta) * dist;
    pos.z = cos(bTheta) * dist;
    pos.y = sin(dist/scale/4 + theta) * amplitude;
    bTheta += thetaChanger;
    
    pushMatrix();
    translate(pos.x,pos.y,pos.z);
    rotateY(bTheta);
    rotateX(-cos(dist/scale/4 + theta)/4);
    stroke(0);
    fill(#3B1F1F);
    box(200,50,100);
    translate(0,-125,0);
    fill(255);
    box(5,200,5);
    
    if(bTheta < 0)
      triangle(0,-100,0,75,100,75);
    else
      triangle(0,-100,0,75,-100,75);
    popMatrix();
  }
}
