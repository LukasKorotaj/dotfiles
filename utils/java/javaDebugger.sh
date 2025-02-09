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
MAIN_FILE="$SRC_DIR/${MAIN_CLASS//.//}.java"

# Compile the Java files
echo "Compiling Java files..."
javac -g -d $BIN_DIR $JAVA_FILES

# Check if the compile was successful
if [ $? -eq 0 ]; then
    echo "Compilation successful."

    echo "Going to neovim."
    nvim $MAIN_FILE
else
    echo "Compilation failed."
    exit 1
fi
