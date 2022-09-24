/**
 * Class which represent a ball that bounces
 **/
class Ball {
  
  // the position of the ball in the world
  PVector position;
  
  // the initial velocity of the ball
  PVector velocity0;
  
  PVector velocity;
  
  //
  PVector acceleration;

  // the radius of the ball
  float radius;
  
  // the mass of the ball
  float m = 1;
  
  ////////////////////////////////////// CONSTANT
  // air resistance constant
  final float D = 0.4;
  // restitution coefficient
  float CR = 0.73;
  // friction constant
  float CF = 0.8;

  /**
   * Constructor of the object
   **/
  Ball(float x, float y, float r_) {
    position = new PVector(x, y);
    velocity0 = PVector.random2D();
    velocity0.mult(10);
    radius = r_;
    velocity = velocity0;
  }

  /**
   * Update the attribute of the ball
  **/ 
  void update() {
    PVector tmp = new PVector(velocity.x * (-D / m), velocity.y * (-D / m) );
    acceleration = tmp.add(GRAVITY); 
    
    velocity = velocity0.add(acceleration);
    
    position.add(velocity);
  }


  
  void checkBoundaryCollision() {
    if (position.x > width-radius) {
      position.x = width-radius;
      //velocity.x *= -1;
      // modification of transversale velocity (friction)
      velocity.y *= (1-CF)*10;
      // modification of normale velocity (bouncy)
      velocity.x *= -CR*10;
    }
    if (position.x < radius) {
      position.x = radius;
      //velocity.x *= -1;
      velocity.y *= (1-CF);
      velocity.x *= -CR*10;
    }
    if (position.y > height-radius) {
      position.y = height-radius;
      //velocity.y *= -1;
      velocity.x *= (1-CF);
      velocity.y *= -CR*10;
    } 
    // top
    //if (position.y < radius) {
    //  position.y = radius;
    //  //velocity.y *= -1;
    //  velocity.x *= (1-CF);
    //  velocity.y *= -CR;
    //}
    
    //velocity.add(velocity.mult((1-CF)));
  }

 
  /**
   * Display the ball and his velocity vector
   **/
  void display() {
    noStroke();
    fill(204);
    ellipse(position.x, position.y, radius*2, radius*2);
  
    
    // display the velocity of the ball
    stroke(204, 102, 0);
    line(position.x, position.y, position.x+velocity.x*20, position.y+velocity.y*20);
    
  }
}
