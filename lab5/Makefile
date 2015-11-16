all: readWrite pwm

readWrite: readWrite.c
	gcc -std=c99 -o readWrite readWrite.c -lwiringPi
pwm: pwm.c
	gcc -std=c99 -o pwm pwm.c -lwiringPi
clean:
	rm -r *.o
