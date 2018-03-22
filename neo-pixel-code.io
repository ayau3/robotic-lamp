#include <Adafruit_NeoPixel.h>
#ifdef __AVR__
  #include <avr/power.h>
#endif

// When we setup the NeoPixel library, we tell it how many pixels, and which pin to use to send signals.
// Note that for older NeoPixel strips you might need to change the third parameter--see the strandtest
// example for more information on possible values.
Adafruit_NeoPixel pixels = Adafruit_NeoPixel(2, 12, NEO_GRB + NEO_KHZ800);


void setup() {
  pixels.begin();
  Serial.begin(9600);

}

int red [] = {198, 9, 0};
int blue [] = {43, 106, 255};
int green [] = {21, 183, 18};

void loop() {
  int color [3]; 

  int sensorValue = analogRead(A0);

  Serial.println(sensorValue);
  
  if (255 <= sensorValue){
    for(int i = 0; i < 3; i+=1){
      color[i] = red[i];
    }
  }
  if (511<=sensorValue){
    for(int i = 0; i < 3; i+=1){
      color[i] = green[i];
    }
  }
  if (700<=sensorValue)  {
    for(int i = 0; i < 3; i+=1){
        color[i] = blue[i];
     }
  }
  
  //pixels.setPixelColor(0, pixels.Color(99, 134, 25));
  //pixels.setPixelColor(0, pixels.Color(green[0], green[1], green[2]));
  //pixels.setPixelColor(1, pixels.Color(green[0], green[1], green[2]));
  pixels.setPixelColor(0, pixels.Color(color[0], color[1], color[2]));
  pixels.setPixelColor(1, pixels.Color(color[0], color[1], color[2]));
  pixels.show();
  
}
