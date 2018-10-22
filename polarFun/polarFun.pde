float r;
int x;
int y;
float theta1;
float theta2;
float ss=1;
int a = 0;
int c = 0;
int barWidth=10;
int barSpace=2;
PVector [] points;
float [] theta;
float [] radius;

color [] colorp;

void setup() {
  size(800, 800);
  frameRate(5);;
  println("Setup called");
  points = new PVector[4];
  theta  = new float[4];
  radius = new float[4];

  colorp = new color[4];
  colorp[0] = #f5e965;
  colorp[1] = #ff9668;
  colorp[2] = #db456f;
  colorp[3] = #a74faf;

  colorp[0] = #efecec;
  colorp[1] = #62929a;
  colorp[2] = #5c5757;
  colorp[3] = #363434;


  for (int i=0; i < 4; i++) {
    points[i] = new PVector(0, 0);
    theta[i] = 0;  
    println(points[i].x, points[i].y);
  }

  ellipseMode(CENTER);

  radius[0] = 50;
  radius[1] = 50;
  radius[2] = 150;
  radius[3] = 150;

  background( colorp[3] );
  r=0;
}

void draw() {
  //fill(255,20);
  //rect(0,0, width, height);

  // Translate the origin point to the center of the screen
  translate(width/2, height/2);
  //scale(ss);
  //rotate(radians(r));
  //r+=5;
  //ss+=.1;
  //drawme();



 
}

void keyPressed() {
  drawme();
}

void drawme() {
   background( colorp[3] );
   
  for (int z = 0; z < 360/ barWidth ; z++) {
    a+=barWidth;
    float r1 = random(40, 90);
    //float r1=30;
    float r2 = random(200, 300);
    radius[0] = r1;
    radius[1] = r1;
    radius[2] = r2;
    radius[3] = r2;
    c++;


    theta[0] = radians(a);
    theta[1] = radians(a+barWidth-barSpace);
    theta[2] = radians(a);
    theta[3] = radians(a+barWidth-barSpace);

    // Convert polar to cartesian
    for (int i=0; i < 4; i++) {
      points[i].x = radius[i] * cos(theta[i]);
      points[i].y = radius[i] * sin(theta[i]);
    }

    //println( int(c % 4) );
    fill(colorp[ int(c % 3)] );


    noStroke();
    beginShape();
    vertex(points[0].x, points[0].y);
    vertex(points[2].x, points[2].y);
    vertex(points[0].x, points[0].y); 
    vertex(points[2].x, points[2].y);
    vertex(points[3].x, points[3].y);
    vertex(points[1].x, points[1].y);
    endShape();
  }
  
  saveFrame("output.jpg");
}
