class Coin {
  int x;
  int y;
  int counter;

  PImage img1 = loadImage("coin1.png");
  PImage img2 = loadImage("coin2.png");
  PImage img3 = loadImage("coin3.png");
  PImage img4 = loadImage("coin4.png");
  PImage img5 = loadImage("coin5.png");
  PImage img6 = loadImage("coin6.png");
  Coin(int x, int y) {
    this.x=x;
    this.y=y;
  }

  void imageTransition(PImage pic1, PImage pic2, PImage pic3, PImage pic4, PImage pic5, PImage pic6, int x, int y) {  // passing images as argurments to animate coins  

    if (counter < 10) { // 0-9 (10) 
      image(pic1, x, y);
    } else if (counter < 20) { // 10-19 (10)
      image(pic2, x, y);
    } else if (counter < 30) { // 20-29 (10)
      image(pic3, x, y);
    } else if (counter < 40) {
      image(pic4, x, y);
    } else if (counter < 50) {
      image(pic5, x, y);
    } else if (counter < 60) {
      image(pic6, x, y);
    } else { 
      image(pic1, x, y); //10th time 3th drawn
      counter=0;
    } 
    counter++;
  }

  void render() {
    img1.resize(20, 20);
    img2.resize(20, 20);
    img3.resize(20, 20);
    img4.resize(8, 18);
    img5.resize(20, 20);
    img6.resize(20, 20);
    imageTransition(img1, img2, img3, img4, img5, img6, x, y);
  }   

  boolean collision(Player player) {
   return(abs(this.x-player.x)<15 && abs(this.y-player.y)<30);
  }
}
