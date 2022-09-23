/**
 * Class which represent a ball that bounces
 **/
class Ball {
  
  // the position of the ball in the world
  PVector position;
  
  // the velocity of the ball
  PVector velocity;

  // the radius of the ball
  float radius;
  
  // the mass of the ball
  float m;
  
  ////////////////////////////////////// CONSTANT
  // air resistance constant
  final float d = 1.0;
  // restitution coefficient
  final float cr = 1.0;
  // friction constant
  final float c = 1.0;

  /**
   * Constructor of the object
   **/
  Ball(float x, float y, float r_) {
    position = new PVector(x, y);
    velocity = PVector.random2D();
    velocity.mult(4);
    radius = r_;
    m = radius*.1;
  }


  /**
   * Update the attribute of the ball
   **/
  void update() {
    position.add(velocity);
    velocity.mult(0.995);
  }


  
  void checkBoundaryCollision() {
    if (position.x > width-radius) {
      position.x = width-radius;
      velocity.x *= -1;
    } else if (position.x < radius) {
      position.x = radius;
      velocity.x *= -1;
    } else if (position.y > height-radius) {
      position.y = height-radius;
      velocity.y *= -1;
    } else if (position.y < radius) {
      position.y = radius;
      velocity.y *= -1;
    }
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
