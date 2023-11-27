int counter=20;
int time=millis();
int oneSec=1;
int level=1;
int coin=2;
void setup(){
  size(200,200);
}
void draw(){
  background(0);
 
if(millis()/1000 > oneSec){
  
  if(counter>0){
  counter--;
  }
  else {
  counter=0;
  }
  
  oneSec++;
}


if(coin<=0){
  counter=0;
  level=2;
  coin=3;
}

if (level==2){
  if(counter<=0){
  counter=10;
  }
  level=3;
}

if (level==3){
  if(counter<=0){
  counter=50;
  }
}
text(counter,width/2,height/2);
text("coin: " + coin,20,20);
}

void keyPressed(){
  coin--;
}
