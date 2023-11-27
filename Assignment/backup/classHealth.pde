class Health{
  int x;
  
  PImage img1 = loadImage("health.png");
  
  Health(int x){
    this.x=x;
  }
 
  void render(){
    image(img1,x,60);
  }
  
  void update(){
    render();
  }
    
}
