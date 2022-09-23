/**
 * Class which represent a ball that bounces
 **/
class Ball {
  
  // the position of the ball in the world
  PVector position;
  
  // the velocity of the ball
  PVector velocity;
  
  //
  PVector acceleration;

  // the radius of the ball
  float radius;
  
  // the mass of the ball
  float m;
  
  ////////////////////////////////////// CONSTANT
  // air resistance constant
  final float D = 0.4;
  // restitution coefficient
  final float CR = 0.73;
  // friction constant
  final float C = 0.8;

  /**
   * Constructor of the object
   **/
  Ball(float x, float y, float r_) {
    position = new PVector(x, y);
    velocity = PVector.random2D();
    velocity.mult(10);
    radius = r_;
    m = 1;
  }


  /**
   * Update the attribute of the ball
   **/
  void update() {
    System.out.print(velocity.x+" "+velocity.y+"   ");
    PVector tmp = new PVector(velocity.x * (-D / m), velocity.y * (-D / m) );
    acceleration = tmp.add(GRAVITY); 
    
    velocity.add(acceleration);
    
    
    
    System.out.println(velocity.x+" "+velocity.y+"   ");
    position.add(velocity);
  }


  
  void checkBoundaryCollision() {
    if (position.x > width-radius) {
      position.x = width-radius;
      velocity.x *= -1;
    }
    if (position.x < radius) {
      position.x = radius;
      velocity.x *= -1;
    }
    if (position.y > height-radius) {
      position.y = height-radius;
      velocity.y *= -1;
    } 
    if (position.y < radius) {
      position.y = radius;
      velocity.y *= -1;
    }
    
    //velocity.add(velocity.mult((1-CR)));
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
