all: hyper

hyper: hyperquicksort.cpp
	mpic++ hyperquicksort.cpp -o hyperquicksort