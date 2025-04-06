/* 
Name
Date
Course
*/

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

// Function Prototypes
// Generates a pseudo-random number using the Linear Congruential Generator (LCG) algorithm.
unsigned int lcg(unsigned int seed);

// Saves the generated random numbers to a binary file.
void save_random_numbers_to_file(const char *filename, unsigned int *numbers, size_t count);

// Loads the random numbers from a binary file into an array.
void load_random_numbers_from_file(const char *filename, unsigned int *


int main() {
    unsigned int seed;  // Initial seed value
    unsigned int random_numbers[];  // Array to store generated random numbers
    size_t count = 100;  // Number of random numbers to generate

    // Generate random numbers using the LCG algorithm
    for (size_t i = 0; i < count; i++) {
        random_numbers[i] = lcg(seed);
        seed = random_numbers[i];  // Update seed for the next random number
    }

    // Display the generated random numbers
    printf("Generated random numbers:\n");
    for (size_t i = 0; i < count; i++) {
        printf("%u ", random_numbers[i]);
    }
    printf("\n");

    // Save the random numbers to a binary file
    save_random_numbers_to_file("random_numbers.dat", random_numbers, count);

    // Load the random numbers from the binary file
    unsigned int loaded_numbers;
    load_random_numbers_from_file("random_numbers.dat", loaded_numbers, count);

    // Display the loaded random numbers (for verification)
    printf("Loaded random numbers from file:\n");
    for (size_t i = 0; i < count; i++) {
        printf("%u ", loaded_numbers[i]);
    }
    printf("\n");

    return 0;
}
