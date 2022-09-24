/**
 * Main script of the program 
 */
 
 
// width of the windows -> 1000cm -> 10m
int dimX = 1000;
// height of the windows  -> 800cm -> 8m
int dimY = 800;
 
// the ball of the project
Ball ball;
// size limits for balls -> 7cm
int[] size_limits = {7,7};
// the limits where balls appears in the windows (0 is the top of the windows)
int[] spawn_limits = {0,80};

// tick elapse
float t = 0.0;

// m/s
final PVector GRAVITY = new PVector(0,9.8);


// Element used for scrollbar
boolean ScrollMousePress = false;
HScrollbar hs;



void settings () {
  // set the size of the windows
   size(dimX, dimY);
}


void setup() {
  this.newBall();
  
  // init the components of the windows
  initIHM();
}


void initIHM() {
  // init the scrollbar at the top left of the windows
  hs = new HScrollbar(20, 20, 100, 16, 15);
}


/**
 * Method call at each frame of the windows
 **/
void draw() {
  background(51);
  
  // update position of the ball and display it
  ball.update();
  ball.display();
  ball.checkBoundaryCollision();

  // update scrollbar
  hs.update();
  hs.display();
  if (ScrollMousePress){
    ScrollMousePress = false;
  }
  
  // update the tick count
  t += 0.01;
  //delay(50);
}


void newBall() {
  
  // init the ball with random size and random position, according to the selected limits
  int taille = (int) random(size_limits[0],size_limits[1]);
  ball = new Ball(random((0+taille/2),(dimX-taille/2)), random(spawn_limits[0]+taille/2, spawn_limits[1]-taille/2), taille);
  t = 0.0;
}


void mousePressed() {
  if ( mouseButton == LEFT ) {
    System.out.print("L ");

  }else if ( mouseButton == RIGHT ) {
    System.out.print("R ");
    /*
    float y =  mouseY - this.ball.position.y > 50.0 ?  mouseY - this.ball.position.y : 50.0;
    PVector diff = new PVector(mouseX - this.ball.position.x, y);
    this.ball.velocity0 = diff.mult(0.05);
    this.ball.velocity = new PVector(this.ball.velocity0.x, this.ball.velocity0.y);
    */
  }
  else if ( mouseButton == CENTER ) {
    System.out.print("C ");
    this.newBall();
    this.ball.position = new PVector(mouseX, mouseY);
  }
  
  if (!ScrollMousePress) {
    ScrollMousePress = true;
  }
  
  System.out.println(mouseX+" "+mouseY+"\n");
}
