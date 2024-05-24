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
if ! find_in_file "patients.txt" "$search_name"; then
        echo "Search failed. Patient not found."
    fi
}


# Function to manage doctor-patient daily planner
doctor_daily_planner() {
    echo "Doctor's Daily Planner"
    echo "-----------------------"
    read -p "Enter doctor's name: " doctor_name
    read -p "Enter patient's name: " patient_name
    read -p "Enter diagnosis: " diagnosis
    read -p "Enter review date (MM/DD/YYYY): " review_date
    read -p "Enter medication list: " medication
    data="$review_date - Doctor: $doctor_name, Patient: $patient_name, Diagnosis: $diagnosis, Medication: $medication"
    save_to_file "doctor_daily_planner.txt" "$data"
    echo "Task added to the doctor's daily planner."
}

# Function to manage patient's daily planner
patient_daily_planner() {
    echo "Patient's Daily Planner"
    echo "------------------------"
    read -p "Enter patient's name: " patient_name
    read -p "Enter doctor's name: " doctor_name
    read -p "Enter review date (MM/DD/YYYY): " review_date
    read -p "Enter medication list: " medication
    data="$review_date - Doctor: $doctor_name, Patient: $patient_name, Medication: $medication"
    save_to_file "patient_daily_planner.txt" "$data"
    echo "Task added to the patient's daily planner."
}

# Main menu
while true; do
    echo "Hospital Management System"
    echo "--------------------------"
    echo "1. Add New Patient"
    echo "2. View Patient Information"
    echo "3. Search for Patient"
    echo "4. Doctor's Daily Planner"
    echo "5. Patient's Daily Planner"
    echo "6. Exit"
    read -p "Enter your choice: " choice

    case $choice in
        1) add_patient ;;
        2) view_patient_info ;;
        3) search_patient ;;
        4) doctor_daily_planner ;;
        5) patient_daily_planner ;;
        6) echo "Exiting program." && break ;;
        *) echo "Invalid choice. Please enter a number between 1 and 6." ;;
    esac
done
