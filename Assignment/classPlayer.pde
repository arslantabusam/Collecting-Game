class Player {
  int x;
  int y;
  int speed;
  int counter;

  //load images
  PImage img1 = loadImage("right1.png");
  PImage img2 = loadImage("right2.png");
  PImage img3 = loadImage("right3.png");
  PImage img4 = loadImage("left1.png");
  PImage img5 = loadImage("left2.png");
  PImage img6 = loadImage("left3.png");  
  PImage img7 = loadImage("up1.png");
  PImage img8 = loadImage("up2.png");
  PImage img9 = loadImage("up3.png"); 
  PImage img10 = loadImage("down1.png");
  PImage img11 = loadImage("down2.png");
  PImage img12 = loadImage("down3.png");

  Player(int x, int y, int speed) { //constructor
    this.x=x; //members
    this.y=y;
    this.speed= speed;
  }

  void render(PImage pic){
     image(pic, x, y);
  }

  void animation(PImage pic1, PImage pic2, PImage pic3, int x, int y) {  // passing images as argurments to swtich animation direction 
   
    if (counter < 10) { // 0-9 (10) 
      image(pic1, x, y);
    } else if (counter < 20) { // 10-19 (10)
      image(pic2, x, y);
    } else if (counter < 30) { // 20-29 (10)
      image(pic3, x, y);
    } else { 
      image(pic1, x, y); //10th time 3th drawn
      counter=0;
    } 
    counter++;
  }

  void detectPlayerDirection() { //selects which animation should be displayed according to the key Pressed
    if (playerDirection==1)
      animation(img1, img2, img3, x, y); //moving right
    else if (playerDirection==2)
      animation(img4, img5, img6, x, y);  //moving left
    else if (playerDirection==3)
      animation(img7, img8, img9, x, y);  //moving up
    else if (playerDirection==4)
      animation(img10, img11, img12, x, y);  //moving down
  }


  void screenplayBorders() { 
    // limits player's movement to the play screen
    // and tells how playes should behave in case no key or a non-coded key is pressed
    if (x>=width-20 && keyCode == RIGHT || x<=20 && keyCode == LEFT || 
      y<=125 && keyCode == UP || y>=height-30 && keyCode == DOWN || 
      !keyPressed || key != CODED) { 

      playerDirection=0;
      render(img11);
    }
  }

  void update() { 
    screenplayBorders();
    detectPlayerDirection();
  }
}
