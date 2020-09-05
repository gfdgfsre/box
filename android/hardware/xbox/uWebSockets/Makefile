.PHONY: examples
examples:
# HelloWorld
	clang -flto -O3 -c -IuSockets/src uSockets/src/*.c uSockets/src/eventing/*.c
	clang++ -flto -O3 -c -std=c++17 -Isrc -IuSockets/src examples/HelloWorld.cpp
	clang++ -flto -O3 -s *.o -o HelloWorld
	rm *.o

# HttpServer (currently quire broken, mind you)
	clang -flto -O3 -c -IuSockets/src uSockets/src/*.c uSockets/src/eventing/*.c
	clang++ -flto -O3 -c -std=c++17 -Isrc -IuSockets/src examples/HttpServer.cpp
	clang++ -flto -O3 -s *.o -o HttpServer -lssl -lcrypto -lpthread -lstdc++fs
	rm *.o

# I don't know what this is supposed to do
main:
	clang -flto -O3 -c -IuSockets/src uSockets/src/*.c uSockets/src/eventing/*.c
	clang++ -flto -O3 -c -std=c++17 -Isrc -IuSockets/src misc/main.cpp
	clang++ -flto -O3 -s *.o -o Main -lssl -lcrypto -lpthread
	rm *.o

# I don't have any tests yet
tests:
	clang -flto -O3 -c -IuSockets/src uSockets/src/*.c uSockets/src/eventing/*.c
	clang++ -flto -O3 -c -std=c++17 -Isrc -IuSockets/src tests.cpp
	clang++ -flto -O3 -s *.o -o uWS_tests -lssl -lcrypto -lpthread
	rm *.o
