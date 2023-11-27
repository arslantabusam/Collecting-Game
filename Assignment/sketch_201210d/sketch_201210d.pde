int counter=20;
int time = millis();

void setup(){
   size(200,200);
}

void draw(){
 background(0);

if (millis() > time + 1000){
    counter--;
    time = millis();
  }
  
 if(counter<=0){
   counter=20;
 }
  
  text(counter,width/2, height/2);
}
