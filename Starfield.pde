Particle stars[] = new Particle[1100];
blackHole hole;
blackHole2 hole2;
void setup(){
  size(500,500);
  hole = new blackHole();
  hole2 = new blackHole2();
  for(int i = 0; i< stars.length; i++){
    stars[i] = new Particle();
  }
  for(int i = 0; i<100; i++){
    stars[i] = new OddBall();
  }
}

class Particle{
  double pX, pY, pSpeed, pAngle, pSize;
  int pColor;
  Particle(){
    pX = 250;
    pY = 250;
    pSpeed = (int)(Math.random()*10)+1;
    pAngle = Math.random()*2*Math.PI;
    pColor = color(255,255,255);
    pSize = 10;
  }
 
  void move(){
    pX += Math.cos(pAngle)*pSpeed;
    pY += Math.sin(pAngle)*pSpeed;
  }
 
  void show(){  
    fill(pColor);
    ellipse((float)pX,(float)pY,(float)pSize,(float)pSize);
  }
}

class OddBall extends Particle{
  OddBall(){
    pX = 250;
    pY = 250;
    pSpeed = (int)(Math.random()*10)+3;
    pAngle = Math.random()*2*Math.PI;
    pColor = color((int)(Math.random()*266),(int)(Math.random()*266),(int)(Math.random()*266));
    pSize = 14;
  }
}
class blackHole{
  int bX, bY, bColor, bSize, bSpeed;
  blackHole(){
    bX = -50;
    bY = 250;
    bColor = color(255);
    bSize = 100;
    bSpeed = 1;
  }
 
  void move(){
    bX+=bSpeed;
  }
  void show(){
    fill(bColor);
    ellipse(bX,bY,bSize,bSize);
  }
}

class blackHole2 extends blackHole{
  blackHole2(){
    bX = 550;
    bY = 250;
    bColor = color(255);
    bSize = 100;
    bSpeed = -1;
  }
}

void draw(){
  background(0);
  hole.show();
  hole.move();
  hole2.show();
  hole2.move();
  if(mousePressed == true){
    hole.bSpeed++;
    hole2.bSpeed--;
  }
  if(hole.bX > hole2.bX){
    hole.bColor = color(0);
    hole2.bColor = color(0);
    hole.bSpeed = 0;
    hole2.bSpeed = 0;
    for(int i = 0; i<stars.length; i++){
      stars[i].show();
      stars[i].move();
    }
    for(int i = 0; i<100; i++){
      stars[i].show();
      stars[i].move();
    }
  }
}
