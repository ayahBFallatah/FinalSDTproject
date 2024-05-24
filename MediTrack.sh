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

# Function to add a new patient
add_patient() {
    echo "Add New Patient"
    echo "----------------"
    read -p "Enter patient name: " name
    read -p "Enter patient age: " age
    read -p "Enter patient gender: " gender
    data="$name, $age, $gender"
    save_to_file "patients.txt" "$data"
    echo "Patient added successfully."
}

# Function to view patient information
view_patient_info() {
    echo "View Patient Information"
    echo "------------------------"
    read_from_file "patients.txt"
}

# Function to search for a patient by name
search_patient() {
    echo "Search for Patient"
    echo "------------------"
    read -p "Enter patient name to search: " search_name
    find_in_file "patients.txt" "$search_name"
}

