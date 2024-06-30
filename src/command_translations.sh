#!/bin/bash

# Function to list files
list_files() {
    ls "$@"
}

# Function to change directory
change_directory() {
    cd "$@"
}

# Function to show current directory
show_current_directory() {
    pwd
}

# Add more functions as needed
