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
  float m;
  
  ////////////////////////////////////// CONSTANT
  // air resistance constant
  final float D = 0.4;
  // restitution coefficient
  float CR = 0.74;
  // friction coefficient
  float CF = 0.6;


  /**
   * Constructor of the object
   **/
  Ball(float x, float y, float diametre, float masse, float cr) {
    position = new PVector(x, y);
    velocity0 = new PVector(random(-20,20),random(-2,-3));
    //velocity0 = new PVector(0, 0);
    //velocity0.mult(10);
    radius = diametre / 2;
    velocity = new PVector(velocity0.x, velocity0.y);
    m = masse;
    CR =cr;
  }

  /**
   * Update the attribute of the ball
  **/ 
  void update() {
    /*PVector tmp = new PVector(velocity.x * (-D / m), velocity.y * (-D / m) );
    acceleration = tmp.add(GRAVITY); 
    
    tmp = new PVector(velocity0.x, velocity0.y);
    velocity = tmp.add(acceleration);*/
    
    //System.out.print(velocity.x+" "+velocity.y+"         ");
    
    PVector tmp = new PVector(velocity.x * (-D / m), velocity.y * (-D / m) );
    acceleration = tmp.add(GRAVITY); 
    
    tmp = new PVector(velocity0.x, velocity0.y);
    velocity = tmp.add(acceleration.mult(t));
    
    //System.out.println(velocity.x+" "+velocity.y);
    position.add(velocity);
  }


  
  void checkBoundaryCollision() {
    // RIGHT
    if (position.x > width-radius) {
      position.x = width-radius;
      //velocity.x *= -1;
      // modification of transversale velocity (friction)
      velocity.y *= (1-CF);
      // modification of normale velocity (bouncy)
      velocity.x *= -CR;
      velocity0.x *= -1;
    }
    
    // LEFT
    if (position.x < radius) {
      position.x = radius;
      //velocity.x *= -1;
      velocity.y *= (1-CF);
      velocity.x *= -CR;
      velocity0.x *= -1;
    }
    
    // BOTTOM
    if (position.y > height-radius) {
      position.y = height-radius;
      //velocity.y *= -1;
      velocity.x *= (1-CF);
      velocity.y *= -CR;
      velocity0 = velocity;
      
      t = 0.1;
    }
    
    // TOP
    if (position.y < radius) {
      position.y = radius;
      //velocity.y *= -1;
      velocity.x *= (1-CF);
      velocity.y *= -CR;
      velocity0 = velocity;
      
      t = 0.1;
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
