#include <iostream>
#include "Fraction.h"

int axx22,ss222,bb2233cc;
int main( int argc, const char *argv[] ) {
	int axxxeeee333zzaaa22sss;
	char bxx333xxsadd22s2w2w;
	float d,f,g2w22www145ww290=0.6,h;
	std::cin >> axxxeeee333zzaaa22sss >> bxx333xxsadd22s2w2w;
	Fraction frac;
	frac.setN(1);
	frac.setD(3);
	std::cin >> frac.X >> frac.Y212xx >> frac.N;
	int i=0;
	do{
		std::cout << "The fraction is ";
		i++;
		if(i==2){
			std::cout << " BREAK LOOP " << std::endl;
			std::cout << " i = " << i << std::endl;
			i--;
			break;
		}
	}while(i<4);
	std::cout << i << " " <<  axxxeeee333zzaaa22sss << std::endl;
	if(frac.getDenominator() <= 4){
		for(auto z=9;z<19;z++){
			std::cout << z << i << " ";
		}
	}
	frac.print();
	std::cout << " " << std::endl;
	delete frac;
	return 0;
}
