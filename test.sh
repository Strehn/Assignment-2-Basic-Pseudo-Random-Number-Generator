#!/bin/bash

# -----------------------------------------------------------------------------
# Test Script for Random Number Generator Program
# This script:
# 1. Compiles the program
# 2. Checks for successful execution
# 3. Validates program output to the console
# 4. Verifies creation and contents of 'random_numbers.dat'
# -----------------------------------------------------------------------------

echo "== Running tests for Random Number Generator =="

# Step 1: Compile the program
echo "--> Compiling the program using Makefile..."
make

# Step 2: Run the program and capture the output
echo "--> Executing the program..."
output=$(./a.out)

# Step 3: Verify the program exits successfully
if [ $? -eq 0 ]; then
    echo "✓ Pass: Program exited with status 0 (success)"
else
    echo "✗ Fail: Program did not exit successfully (non-zero exit code)"
    exit 1
fi

# Step 4: Check if expected output string is printed
expected_output="Generated random numbers:"
echo "--> Checking if program prints expected output string..."
if echo "$output" | grep -q "$expected_output"; then
    echo "✓ Pass: Found expected output string: '$expected_output'"
else
    echo "✗ Fail: Did not find expected output string in program output"
    echo "     Program output was:"
    echo "$output"
    exit 1
fi

# Step 5: Check that 'random_numbers.dat' file was created
echo "--> Verifying that output file 'random_numbers.dat' exists..."
if [ -f "random_numbers.dat" ]; then
    echo "✓ Pass: File 'random_numbers.dat' exists"
    # Step 6: Check that file is not empty
    if [ -s "random_numbers.dat" ]; then
        echo "✓ Pass: File 'random_numbers.dat' is not empty"
    else
        echo "✗ Fail: File 'random_numbers.dat' is empty"
        exit 1
    fi
else
    echo "✗ Fail: File 'random_numbers.dat' does not exist"
    exit 1
fi

# Final message
echo
echo "🎉 All tests passed successfully!"
exit 0
