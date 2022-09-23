/**
 * Main script of the program 
 */
 
 
// width of the windows
int dimX = 1700;
// height of the windows
int dimY = 800;
 
// the ball of the project
Ball ball;
// size limits for balls
int[] size_limits = {30,40};
// the limits where balls appears in the windows (0 is the top of the windows)
int[] spawn_limits = {0,80};


// Element used for scrollbar
boolean ScrollMousePress = false;
HScrollbar hs;



void settings () {
  // set the size of the windows
   size(dimX, dimY);
}


void setup() {
  // init the ball with random size and random position, according to the selected limits
  int taille = (int) random(size_limits[0],size_limits[1]);
  ball = new Ball(random((0+taille/2),(dimX-taille/2)), random(spawn_limits[0]+taille/2, spawn_limits[1]-taille/2), taille);
  
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
}


void mousePressed() {
  if ( mouseButton == LEFT ) {
    System.out.print("L ");
    PVector diff = new PVector(mouseX - this.ball.position.x, mouseY - this.ball.position.y);
    this.ball.velocity = diff.mult(0.01);
  }else if ( mouseButton == RIGHT ) {
    System.out.print("R ");
    this.ball.position = new PVector(ball.position.x, 0+ size_limits[1]);
  }
  else if ( mouseButton == CENTER ) {
    System.out.print("C ");
    this.ball.position = new PVector(mouseX, mouseY);
  }
  
  if (!ScrollMousePress) {
    ScrollMousePress = true;
  }
  
  System.out.println(mouseX+" "+mouseY+"\n");
}
