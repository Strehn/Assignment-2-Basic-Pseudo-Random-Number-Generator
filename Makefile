# Compiler and flags
CC = gcc
CFLAGS = -Wall -g -std=c99

# Target executable
TARGET = a.out

# Default target
all: $(TARGET)

# Compile the program
$(TARGET): main.c
	$(CC) $(CFLAGS) -o $(TARGET) main.c

# Clean up the generated files (e.g., object files, executable)
clean:
	rm -f $(TARGET) random_numbers.dat

# Run the tests (typically invoked by the test script)
run: $(TARGET)
	./$(TARGET)

# Phony targets
.PHONY: all clean run
