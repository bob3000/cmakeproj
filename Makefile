.PHONY: clean release debug test docs run

build/CMakeCache.txt:
	cmake -S . -B build -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_BUILD_TYPE=Debug

release:
	cmake -S . -B build -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_BUILD_TYPE=Release
	cmake --build build

debug: build/CMakeCache.txt
	cmake --build build

run: debug
	cmake --build build --target run

clean:
	cmake --build build --target clean

test: debug
	cmake --build build --target test

docs: debug
	cmake --build build --target docs
