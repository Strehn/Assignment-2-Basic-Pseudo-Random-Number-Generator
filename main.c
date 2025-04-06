/* 
Name
Date
Course
*/

include <stdio.h>
#include <stdlib.h>
#include <time.h>

// Function prototypes
void generate_random_numbers(int *numbers, int count, unsigned int seed);
void save_random_numbers_to_file(const char *filename, int *numbers, int count);
void load_random_numbers_from_file(const char *filename, int *numbers, int count);
void print_random_numbers(int *numbers, int count);

int main() {
    // Define how many random numbers we want to generate
    int count = 10;
    int numbers[count]; // Array to store generated numbers

    // Use the current time as a seed for randomness 
    // do not change this otherwise you will fail the test cases
    unsigned int seed = time(NULL); 

    // Generate random numbers using LCG (Linear Congruential Generator)
    generate_random_numbers(numbers, count, seed);

    // Print the random numbers
    printf("Generated random numbers:\n");
    print_random_numbers(numbers, count);

    // Save the random numbers to a binary file
    save_random_numbers_to_file("random_numbers.dat", numbers, count);
    printf("\nRandom numbers saved to 'random_numbers.dat'.\n");

    // Load the numbers back from the file
    int loaded_numbers[count];
    load_random_numbers_from_file("random_numbers.dat", loaded_numbers, count);

    // Print loaded numbers
    printf("\nLoaded random numbers from file:\n");
    print_random_numbers(loaded_numbers, count);

    return 0;
}
