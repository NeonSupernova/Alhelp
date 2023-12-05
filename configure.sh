#!/bin/bash

# Function to check if a command is available
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check if Python is installed
if ! command_exists "python"; then
    echo "Python is not installed. Please install Python before continuing."
    echo "On Windows, you can use tools like MSYS2 (https://www.msys2.org/) to install python."
    echo "Run pacman -Sy python"
    exit 1
fi

# Check if GNU Make is installed
if ! command_exists "make"; then
    echo "GNU Make is not installed. Please install GNU Make before continuing."
    echo "On Windows, you can use tools like MSYS2 (https://www.msys2.org/) to install Make."
    echo "Run pacman -Sy python"
    exit 1
fi

echo "Creating a virtual environment for python"

# Create a virtual environment
echo "Python virtual environment 'venv' created."
echo "Activate the virtual environment using:"
echo "./.venv/bin/activate (on Linux/Mac)"
echo ".\.venv\Scripts\Activate (on Windows)"
