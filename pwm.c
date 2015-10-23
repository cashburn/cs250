#include <stdio.h>
#include <wiringPi.h>
#include <softPwm.h>

#define LEDR 29
#define LEDG 28
#define LEDB 27
#define BUTTONR 25
#define BUTTONG 24
#define BUTTONB 23
int main(void) {
	if(wiringPiSetup() == -1)
        return 1;
    pinMode(LEDR, OUTPUT);
    pinMode(LEDG, OUTPUT);
    pinMode(LEDB, OUTPUT);
    pinMode(BUTTONR, INPUT);
    pinMode(BUTTONG, INPUT);
    pinMode(BUTTONB, INPUT);
    int value[3];
    int red = 0;
    int green = 0;
    int blue = 0;
    while(1) {
        red = digitalRead(BUTTONR);
        green = digitalRead(BUTTONG);
        blue = digitalRead(BUTTONB);
        digitalWrite(LEDR, red);
        digitalWrite(LEDG, green);
        digitalWrite(LEDB, blue);
        
        delay(100);
    }


	return 0;
}
