all: main_sort

main_sort: bubble.s quicksort.s main_sort.c
	gcc -std=c99 -o main_sort bubble.s quicksort.s main_sort.c -g
clean:
	rm -r *.o
