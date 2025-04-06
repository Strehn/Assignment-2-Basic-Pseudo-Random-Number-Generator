## Assignment 2: Basic Pseudo-Random Number Generator (PRNG)

# Background
In C programming, one of the most common tasks in software development is generating random numbers for various applications, ranging from simulations to games. Pseudo-Random Number Generators (PRNGs) are algorithms used to generate sequences of numbers that approximate the properties of random numbers.
In this assignment, you will implement a basic pseudo-random number generator and demonstrate its limitations. Additionally, you will learn how to manually manage memory, debug programs, and handle file I/O in C. This will help you understand the underlying principles of randomness, how to create your own PRNG, and the potential security concerns that arise from improper PRNG usage.

# Assignment Tasks
PRNG Implementation

You are tasked with writing a function that generates pseudo-random numbers based on the Linear Congruential Generator (LCG) algorithm. The LCG is a simple and widely-used PRNG algorithm, which is defined by the equation:

Xn+1​=(a⋅Xn​+c)modm
Where:

Xn​ is the current state of the generator.

Xn+1​ is the next random number.

a, 
c, and 
m are constants that determine the behavior of the generator.

Implement a function lcg() in C that generates a sequence of pseudo-random numbers.

# Function prototype:

unsigned int lcg(unsigned int seed);
You will need to define the constants 
a, 
c, and 
m as static variables within the function. Use the following values (which are commonly used for LCG):

a=1664525

c=1013904223

m=232

# Demonstrating the Limitations of PRNGs

Generate a sequence of 100 pseudo-random numbers using your lcg() function and display them. Observe the sequence, and notice that while the numbers appear random, there will be a predictable pattern over time. This is the limitation of the LCG PRNG, and you'll discuss this in your report.

# Memory Management and File I/O

Implement a function save_random_numbers_to_file() that takes the generated sequence of pseudo-random numbers and writes them to a binary file (random_numbers.dat).

Implement a function load_random_numbers_from_file() that reads the random numbers from the binary file into an array.

# Use the following function prototypes:

void save_random_numbers_to_file(const char *filename, unsigned int *numbers, size_t count);
void load_random_numbers_from_file(const char *filename, unsigned int *numbers, size_t count);
Debugging and Build System

As part of the build process, you will use the Makefile to automate compiling and linking your program.

The program should be compiled using gcc. Include a debugging option -g in the Makefile to enable debugging support.


# Deliverables
Source Code:

main.c: The main program file with the lcg() function and the save_random_numbers_to_file() and load_random_numbers_from_file() functions.

Makefile: A Makefile that compiles and links the program. It should also support debugging with the -g flag.



# Hints and Tips
The LCG PRNG has the benefit of being simple, but it has weaknesses in terms of randomness. The generated numbers will eventually repeat in a predictable cycle.

Be cautious when handling memory in C. Ensure that any dynamically allocated memory is freed properly to avoid memory leaks.

When working with binary files, keep in mind that file I/O can be tricky with different data types. Be sure to write and read the data correctly, ensuring you respect the data types being handled.

You will be using the POSIX libraries for file I/O in C. Functions like fopen(), fwrite(), fread(), and fclose() will be useful.

Use gdb or lldb to debug your code. Consider setting breakpoints to inspect how the random numbers are generated and how the program handles files.
