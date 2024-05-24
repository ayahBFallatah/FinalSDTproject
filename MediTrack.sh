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
