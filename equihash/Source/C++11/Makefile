#paeq64 optimized

#all: 
#	g++ -g -m64 -maes -mavx -O3 -std=c++11 "pow.cc" "pow-test.cc" "./blake/blake2b.cpp" -o equihash

all: 
	g++ -g -std=c++11 "pow.cc" "pow-test.cc" "./blake/blake2b.cpp" -o equihash

pow.o:
	g++ -g -m64 -maes -mavx -O3 -std=c++11 "pow.cc" "pow-test.cc" "./blake/blake2b.cpp" -o equihash
