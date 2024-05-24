#!/bin/bash

# Function to save data to a file
save_to_file() {
    local file_name=$1
    local data=$2
    echo "$data" >> "$file_name"
}

# Function to read data from a file
read_from_file() {
    local file_name=$1
    cat "$file_name"
}

# Function to find data in a file
find_in_file() {
    local file_name=$1
    local search_term=$2
    grep -i "$search_term" "$file_name"
}
