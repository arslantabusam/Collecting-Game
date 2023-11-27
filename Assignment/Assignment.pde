PImage backGround, splashScreen;
Player player;
int playerDirection=0;
final int SPLASHSCREEN=0;
final int PLAYING=1;
final int FINISH=2;
int gameMode = SPLASHSCREEN;
ArrayList<Coin> coinList;
Coin currentCoin;
int score=0;
ArrayList<Health> healthList;
Health currentHealth;
int healthX=20;
ArrayList<Zombie> zombieList;
Zombie currentZombie;
int level=0;
CountDown timer, splashTimer; //declare instance variable of CountDown




void setup() {
  imageMode(CENTER);
  size(800, 400);
  timer = new CountDown(20); //call CountDown constructor – 20 secs
  splashTimer= new CountDown(10);
  backGround = loadImage("greenGrass.png");
  backGround.resize(width, height);
  player = new Player(20, height/2, 10);
  coinList = new ArrayList<Coin>();
  healthList = new ArrayList<Health>();
  zombieList = new ArrayList<Zombie>();

  for (int i=0; i<3; i++) {
    coinList.add(new Coin((int) random(100, 750), (int) random(160, 270)));
  }

  for (int i=0; i<3; i++) {
    healthList.add(new Health(healthX));
    healthX +=20;
  }
}

void draw() {

  switch(gameMode) {
  case SPLASHSCREEN: 
    splashScreen(); //splash screen is displayed
    break;
  case PLAYING:
    play(); //the game starts 
    break;
  case FINISH: 
    gameOver();
    break;
  }
}


void splashScreen() {
  //splashScreen = loadImage("splashScreenn.png"); //load splashScreen
  //splashScreen.resize(width, height); 
  //image(splashScreen, width/2, height/2); //display splashScreen
  background(0);

  if (level==0) {
    fill(255);
    text("PRESS ANY KEY TO START", width/2-80, height/2);
    text("The game will load automatically in: " + splashTimer.getRemainingTime(), width/2-110, height/2+20);

    if (keyPressed || splashTimer.getRemainingTime()<=0) { 
      timer.durationSeconds += (splashTimer.splashDuration-splashTimer.getRemainingTime()); // sets timer back to the initial value, using a second instance of CountDown class
      gameMode=PLAYING;
      level=1; //changes level value to 1
    }
  } else if (level==2 || level==3) {
    background(0);
    //fill(255);
    // textSize(20);
    int quantityZombie=0;
    if (level==2) {
      quantityZombie=3;
    } else if (level==3) {
      quantityZombie=5;
    } 
    text("Level " + level + " will start in: " + timer.getRemainingTime(), width/2-50, height/2);

    if (timer.getRemainingTime()<=0 || keyCode== ENTER) {
      timer.durationSeconds=20;
      for (int i=0; i<5; i++) {
        coinList.add(new Coin((int) random(100, 750), (int) random(150, 270)));
      }
      for (int i=0; i<quantityZombie; i++) {
        zombieList.add(new Zombie((int)random(830, 930), (int) random(125, height-30), 1));
      }
      gameMode=PLAYING;
      player.x=20;
      player.y=height/2;
    }
  }
  else{
    background(0);
    text("WELL DONE! YOU HAVE FNISHED THE GAME", width/2-100, height/2);
  }
    
    
}

void play() {
  image(backGround, width/2, height/2); //call the procedure/method

  gameInterface(); //call the procedure

  if (timer.getRemainingTime()<=0 && coinList.size() >0 || healthList.size()<=0) { // ends the game if health is less thn 0 or time gets over and there are still coins on the screen
    gameMode=FINISH;
  }

  if (coinList.size() <=0 && healthList.size()>0) {
    score=0;
    timer.durationSeconds=5;
    level++;
    gameMode=SPLASHSCREEN;
    zombieList.clear();
    // text("YOU WON!", width/2-20, height/2);
  }

  player.update();

  for (int i=0; i<healthList.size(); i++) {
    currentHealth = healthList.get(i);
    currentHealth.render();
  }

  if (level==2 || level ==3) {   

    for (int i=0; i<zombieList.size(); i++) {
      currentZombie = zombieList.get(i);
      currentZombie.update();

      if (currentZombie.collision(player)) {
        zombieList.remove(currentZombie);
        healthList.remove(currentHealth);
        image(currentZombie.collisionEffect,(player.x+currentZombie.x)/2, (player.y+currentZombie.y)/2);
      }
    }
  }

  for (int i=0; i<coinList.size(); i++) {
    currentCoin = coinList.get(i);
    currentCoin.render();

    if (currentCoin.collision(player)) {
      coinList.remove(currentCoin);
      score++;
    }
  }
}

void keyPressed() {

  if (key == CODED) {
    if (keyCode == RIGHT && player.x <width-20) {
      playerDirection=1;  
      player.x +=player.speed;
    }//moves player forward when pressing right button

    if (keyCode == LEFT && player.x>20) {
      playerDirection=2;
      player.x -=player.speed;   //moves player backwards when pressing left button
    }
    if (keyCode == UP && player.y >125) {
      playerDirection=3;  
      player.y -=player.speed;  //moves player up when pressing up button
    } 
    if (keyCode == DOWN && player.y <height-30) {
      playerDirection=4;
      player.y +=player.speed;   //moves player down when pressing down button
    }
  }
}

void gameOver() {
  fill(255, 0, 0);
  text("GAME OVER", width/2-20, height/2);
}

void gameInterface() {
  fill(0);
  rect(5, 5, 90, 40); //black rectangle to display score and time
  rect(720, 5, 60, 15); // black rectangle to display level
  fill(255);
  text("SCORE: " + score, 10, 20); //displays coins left to collect
  text("TIME LEFT: " + timer.getRemainingTime(), 10, 40); //displays the countdown timer 
  text("LEVEL: " + level, 725, 18); //displays current level
}
