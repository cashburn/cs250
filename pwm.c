#include <stdio.h>
#include <wiringPi.h>
#include <softPwm.h>

#define LEDR 29
#define LEDG 28
#define LEDB 27
#define BUTTONR 23
#define BUTTONG 24
#define BUTTONB 25
#define PLUS 4
#define MINUS 5
int main(void) {
	if(wiringPiSetup() == -1)       //begin setup()
        return 1;
    pinMode(LEDR, OUTPUT);          //set I/O pins
    pinMode(LEDG, OUTPUT);
    pinMode(LEDB, OUTPUT);
    pinMode(BUTTONR, INPUT);
    pinMode(BUTTONG, INPUT);
    pinMode(BUTTONB, INPUT);
    pinMode(PLUS, INPUT);
    pinMode(MINUS, INPUT);

    softPwmCreate(LEDR, 0, 100);    //start PWM from 0 to 100
    softPwmCreate(LEDG, 0, 100);
    softPwmCreate(LEDB, 0, 100);
    int selector = 0;               //color selector
    int value[3];                   //color values: R=0,G=1,B=2
    int plus = 0;                       //set when the plus5 or minus5 buttons are used
    int minus = 0;
    int input = 0;
    int changed;
    for (int i = 0; i < 3; i++) {
        value[i] = 0;
    }

    while(1) {                      //begin loop
        changed = 0;
        if (digitalRead(BUTTONR))   //select color
            selector = 0;
        if (digitalRead(BUTTONG))
            selector = 1;
        if (digitalRead(BUTTONB))
            selector = 2;
        input = digitalRead(PLUS);
        if (input != plus) {         //read plus5/minus5
            plus = input;
            if (input && (value[selector] < 100))
                value[selector] += 5;
            changed = 1;
        }
        input = digitalRead(MINUS);
        if (input != minus) {
            minus = input;
            if (input && (value[selector] > 0)) {
                value[selector] -= 5;
            }
            changed = 1;
        }
        if (changed) {              //write values if changed
            softPwmWrite(LEDR, value[0]);
            softPwmWrite(LEDG, value[1]);
            softPwmWrite(LEDB, value[2]);
        }
        delay(100);
    
    }


	return 0;
}
