#!/bin/bash

echo "Running tests..."

# Compile the program (ensure the makefile is correctly configured for this)
make

# Run the program
output=$(./a.out)

# Check if the program ran successfully
if [ $? -eq 0 ]; then
    echo "Pass: Program exited zero"
else
    echo "Fail: Program did not exit zero"
    exit 1
fi

# Check the generated output
expected_output="Generated random numbers:"

if echo "$output" | grep -q "$expected_output"; then
    echo "Pass: Program generated output"
else
    echo "Fail: Program did not produce correct output"
    exit 1
fi

# Check that the file exists and is not empty
if [ -f "random_numbers.dat" ]; then
    echo "Pass: File 'random_numbers.dat' exists"
    # Verify that the file has data by checking its size
    if [ -s "random_numbers.dat" ]; then
        echo "Pass: File 'random_numbers.dat' is not empty"
    else
        echo "Fail: File 'random_numbers.dat' is empty"
        exit 1
    fi
else
    echo "Fail: File 'random_numbers.dat' does not exist"
    exit 1
fi

# Load numbers from the file and compare them
echo "Loading numbers from the binary file..."
loaded_output=$(xxd -p random_numbers.dat | tr -d '\n' | sed 's/\(..\)/\1 /g')

# The expected format for loaded numbers (you would need to manually inspect or calculate based on seed and algorithm)
# This is just an example, you should replace it with the actual expected output from your random numbers
expected_loaded_output="expected_random_number_sequence_here"

if [ "$loaded_output" == "$expected_loaded_output" ]; then
    echo "Pass: Loaded numbers match the expected sequence"
else
    echo "Fail: Loaded numbers do not match the expected sequence"
    echo "Expected: $expected_loaded_output"
    echo "Got: $loaded_output"
    exit 1
fi

# All tests passed
echo
echo "All tests passed."

exit 0
