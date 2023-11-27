class Zombie{
  int x;
  int y;
  int speed;
  int counter;
  
  PImage img1 = loadImage("zombie1.png");
  PImage img2 = loadImage("zombie2.png");
  PImage img3 = loadImage("zombie3.png");
  PImage collisionEffect = loadImage("collisionEffect3.png");

  
  Zombie(int x, int y, int speed){
    this.x=x;
    this.y=y;
    this.speed=speed;  
  }
  
  
  void move(){
   this.x -= this.speed;
   
   if(this.x+40<0){
    this.x=850;
    this.y=(int) random(150,height-30);
    this.speed=(int)random(1,3);
   }
  }
  
  void render(){
       if (counter < 10) { // 0-9 (10) 
      image(img1, x, y);
    } else if (counter < 20) { // 10-19 (10)
      image(img2, x, y);
    } else if (counter < 30) { // 20-29 (10)
      image(img3, x, y);
    } else { 
      image(img1, x, y); //10th time 3th drawn
      counter=0;
    } 
    counter++;
  }
  
  void update(){
    move();
    render();
    collisionEffect.resize(200,200);
  }
  
boolean collision(Player player) {
    return(abs(this.x-player.x)<30 && abs(this.y-player.y)<50);
  }
  
}
