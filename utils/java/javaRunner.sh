#!/bin/bash

# Set directories
SRC_DIR="./src"
BIN_DIR="./bin"

# Check if the user provided a main class argument
if [ -z "$1" ]; then
    echo "Usage: $0 <MainClass>"
    echo "Example: $0 game.TakePinsGame"
    exit 1
fi

# The main class is passed as the first argument
MAIN_CLASS=$1

# Find all .java files in the src/ directory and store them in a variable
JAVA_FILES=$(find $SRC_DIR -name "*.java")

# Compile the Java files
echo "Compiling Java files..."
javac -d $BIN_DIR $JAVA_FILES

# Check if the compile was successful
if [ $? -eq 0 ]; then
    echo "Compilation successful."

    # Run the compiled class from the bin/ directory
    echo "Running Java program..."
    java -cp $BIN_DIR $MAIN_CLASS
else
    echo "Compilation failed."
    exit 1
fi
