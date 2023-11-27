class CountDown{
int durationSeconds;
int oneSec=1; // int variable to check if a second passed
int splashDuration;

CountDown(int duration){
 this.durationSeconds= duration;
 this.splashDuration= duration;
 }

int getRemainingTime(){ //return the seconds left on the timer or 0
 //millis() processing command, returns time in 1000ths sec since program started
 
 if(millis()/1000 > oneSec){ // every second

 if(durationSeconds>0){
  durationSeconds--; //decreases counter every 1 sec
  }
  else 
  durationSeconds=0;
  
  oneSec++; // every secon
 }
 
return durationSeconds;
}

}
