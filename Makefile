CC := gcc
CFLAGS := -Wall -g -c -I include $(shell pkg-config --cflags gtk4)
LIBRARIES := $(shell pkg-config --libs gtk4)

EXECUTABLE := bin/gtk-hello-world.out

MAIN_O := build/main.o
MAIN_C := src/main.c

OBJECTS := $(MAIN_O)

$(EXECUTABLE): $(OBJECTS)
	@mkdir -p bin
	$(CC) $(OBJECTS) $(LIBRARIES) -o $@

$(MAIN_O): $(MAIN_C)
	@mkdir -p build
	$(CC) $(CFLAGS) $< -o $@

clean:
	rm -rf build bin
