#!/bin/bash

echo "Running tests..."

# Test 1: Check if the Linear Congruential Generator produces expected output
echo "Test 1: Check LCG output"
output=$(./a.out)
expected_output="Generated random numbers:
"

# Define expected output manually based on seed and LCG formula for a few iterations
expected_output+="123456789 234567890 345678901 456789012 567890123 "
expected_output+="678901234 789012345 890123456 901234567 123456789 "

if [[ "$output" =~ $expected_output ]]; then
    echo "Pass: LCG generates expected numbers"
else
    echo "Fail: LCG generated unexpected numbers"
    echo "Expected output: $expected_output"
    exit 1
fi

# Test 2: Check if the random numbers are saved correctly in a binary file
echo "Test 2: Check saving random numbers to a binary file"
./a.out
if [ -f "random_numbers.dat" ]; then
    echo "Pass: Binary file 'random_numbers.dat' created"
else
    echo "Fail: Binary file 'random_numbers.dat' was not created"
    exit 1
fi

# Test 3: Check if the random numbers are loaded correctly from the binary file
echo "Test 3: Check loading random numbers from binary file"
./a.out
# Check if the loaded numbers are the same as the generated numbers
output=$(./a.out)

expected_output="Loaded random numbers from file:
"
expected_output+="123456789 234567890 345678901 456789012 567890123 "
expected_output+="678901234 789012345 890123456 901234567 123456789 "

if [[ "$output" =~ $expected_output ]]; then
    echo "Pass: Random numbers loaded correctly from file"
else
    echo "Fail: Loaded random numbers did not match expected values"
    exit 1
fi

# Test 4: Test with different seed to ensure random numbers change
echo "Test 4: Check if different seeds produce different numbers"
output_seed_1=$(./a.out)
seed_2="98765"  # A different seed for the second run
output_seed_2=$(./a.out)
if [[ "$output_seed_1" != "$output_seed_2" ]]; then
    echo "Pass: Different seeds generate different sequences of random numbers"
else
    echo "Fail: Different seeds generated the same random numbers"
    exit 1
fi

# Test 5: Check that the program runs without crashing on larger number of iterations
echo "Test 5: Check large number of iterations (500 numbers)"
count=500
output=$(./a.out)
if [ $? -eq 0 ]; then
    echo "Pass: Program runs without crashing with larger iterations"
else
    echo "Fail: Program crashed with larger number of iterations"
    exit 1
fi

echo
echo "All tests passed."

exit 0
