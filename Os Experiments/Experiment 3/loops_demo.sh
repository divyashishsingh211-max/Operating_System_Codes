#!/bin/bash
# Experiment 3 - Demonstration of conditionals, loops, and arithmetic.

echo "1. for loop over a list"
for name in Ali Rahul Aman
do
  echo "Hello $name"
done

echo
echo "2. for loop over a range"
for i in {1..5}
do
  echo "Count: $i"
done

echo
echo "3. C-style for loop"
for (( i=1; i<=5; i++ ))
do
  echo "Number: $i"
done

echo
echo "4. while loop"
count=1
while (( count <= 5 ))
do
  echo "$count"
  ((count++))
done

echo
echo "5. Arithmetic operations"
a=10
b=3
echo "Addition:       $((a + b))"
echo "Subtraction:    $((a - b))"
echo "Multiplication: $((a * b))"
echo "Division:       $((a / b))"
echo "Modulus:        $((a % b))"
echo "Exponentiation: $((a ** b))"
