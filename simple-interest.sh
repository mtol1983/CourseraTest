#!/bin/bash

# Simple Interest Calculator
# Formula: Simple Interest = (Principal × Rate × Time) / 100

echo "Simple Interest Calculator"
echo "--------------------------"

# Read user input
read -p "Enter the principal amount: " principal
read -p "Enter the rate of interest: " rate
read -p "Enter the time period in years: " time

# Validate input values
if ! [[ "$principal" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
    echo "Error: Principal must be a valid number."
    exit 1
fi

if ! [[ "$rate" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
    echo "Error: Rate of interest must be a valid number."
    exit 1
fi

if ! [[ "$time" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
    echo "Error: Time period must be a valid number."
    exit 1
fi

# Calculate simple interest
simple_interest=$(echo "scale=2; ($principal * $rate * $time) / 100" | bc)

total_amount=$(echo "scale=2; $principal + $simple_interest" | bc)

# Display result
echo ""
echo "Calculation Result"
echo "------------------"
echo "Principal Amount : $principal"
echo "Rate of Interest : $rate%"
echo "Time Period      : $time years"
echo "Simple Interest  : $simple_interest"
echo "Total Amount     : $total_amount"
