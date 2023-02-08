COMPILER := gcc
CFLAGS := -Wall -g -c -I include $(shell pkg-config --cflags gtk4)
LIBRARIES := $(shell pkg-config --libs gtk4)

EXECUTABLE := bin/gtk-hello-world.out

MAIN_O := build/main.o
MAIN_C := src/main.c

GUI_O := build/gui.o
GUI_C := lib/gui.c

OBJECTS := $(GUI_O) $(MAIN_O)

$(EXECUTABLE): $(OBJECTS)
	@mkdir -p bin
	$(COMPILER) $^ $(LIBRARIES) -o $@

$(MAIN_O): $(MAIN_C)
	@mkdir -p build
	$(COMPILER) $(CFLAGS) -c $< -o $@

$(GUI_O): $(GUI_C)
	@mkdir -p build
	$(COMPILER) $(CFLAGS) -c $< -o $@

clean:
	rm -rf build bin
