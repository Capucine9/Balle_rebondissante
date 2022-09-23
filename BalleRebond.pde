/**
 * Main script of the program 
 */
 
 
// activate the 3D mode or not
boolean is3D = false;
// width of the windows
int dimX = 1700;
// height of the windows
int dimY = 800;
 
// amount of balls
int nb_ball = 5;
// size limits for balls
int[] size_limits = {30,40};
// the limits where balls appears in the windows (0 is the top of the windows)
int[] spawn_limits = {0,80};


boolean ScrollMousePress = false;
// Scrollbar
HScrollbar hs;

// the list of balls
Ball[] balls;


void settings () {
  // set the size of the windows
  if ( is3D )
    size(dimX, dimY, P3D);
  else
    size(dimX, dimY);
}

void setup() {
  // init a list of ball with random size and random position, according to the selected limits
  balls = new Ball[nb_ball];
  for ( int i = 0; i < nb_ball; i ++ ) {
    int taille = (int) random(size_limits[0],size_limits[1]);
    balls[i] = new Ball(random((0+taille/2),(dimX-taille/2)), random(spawn_limits[0]+taille/2, spawn_limits[1]-taille/2), taille);
  }
  hs = new HScrollbar(20, 20, 100, 16, 15);
}


void draw() {
  background(51);
  
  for ( int i = 0; i < nb_ball; i++ ) {
    
    // update position of balls and display them
    balls[i].update();
    balls[i].display();
    balls[i].checkBoundaryCollision();
    if ( i != 0 ) {
      // check collisions between balls
      for ( int j = 0; j < i ; j++ ) {
        balls[i].checkCollision(balls[j]);
      }
    }
  }
  hs.update();
  hs.display();
  
  if (ScrollMousePress){
    ScrollMousePress = false;
  }
}


void mousePressed() {
  if ( mouseButton == LEFT ) {
    System.out.print("L ");
    PVector diff = new PVector(mouseX - this.balls[0].position.x, mouseY - this.balls[0].position.y);
    this.balls[0].velocity = diff.mult(0.01);
  }else if ( mouseButton == RIGHT ) {
    System.out.print("R ");
    this.balls[0].position = new PVector(balls[0].position.x, 0+ size_limits[1]);
  }
  else if ( mouseButton == CENTER ) {
    System.out.print("C ");
    this.balls[0].position = new PVector(mouseX, mouseY);
  }
  
  if (!ScrollMousePress) {
    ScrollMousePress = true;
  }
  
  System.out.println(mouseX+" "+mouseY+"\n");
}
