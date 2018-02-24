export JAVADEPS=-I$(JAVA_HOME)/include -I$(JAVA_HOME)/include/linux
export INCLUDES=$(JAVADEPS) -Iequihash/Source/C++11/

all: jniequihash.class jniequihash.h libjniequihash.so run

jniequihash.class: jniequihash.java
	javac jniequihash.java

jniequihash.h: jniequihash.class
	javah -jni jniequihash

libjniequihash.so: jniequihash.cpp pow.o pow-test.o blake.o
	g++ -g -fPIC $(INCLUDES) -o libjniequihash.so -shared jniequihash.cpp pow.o pow-test.o blake.o

pow.o:
	g++ -g -c -std=c++11 -fPIC "equihash/Source/C++11/pow.cc" -o pow.o

pow-test.o:
	g++ -g -c -std=c++11 -fPIC "equihash/Source/C++11/pow-test.cc" -o pow-test.o

blake.o:
	g++ -g -c -std=c++11 -fPIC "equihash/Source/C++11/blake/blake2b.cpp" -o blake.o

run:
	java -Djava.library.path=. jniequihash

clean:
	rm -fr jniequihash.class
	rm -fr jniequihash.h
	rm -fr libjniequihash.so
	rm -fr *o *.log
