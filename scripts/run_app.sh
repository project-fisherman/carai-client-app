#!/bin/bash

# Check if an emulator or device is running
# 'fvm flutter devices' will always show connected devices.
# We look for "ios" or "android" to ensure a mobile device/emulator is connected
# excluding "macOS" and "Chrome".
DEVICES=$(fvm flutter devices | grep -E "ios|android" | grep -v "macOS" | grep -v "Chrome")

if [ -z "$DEVICES" ]; then
    echo "No emulator is running. Please select an emulator to launch:"
    
    # Get available emulators
    # We grep for lines with "•" and not containing "Id" (header)
    EMULATORS_OUTPUT=$(fvm flutter emulators | grep "•" | grep -v "Id")
    
    if [ -z "$EMULATORS_OUTPUT" ]; then
        echo "No emulators found."
        exit 1
    fi
    
    # Read the emulators into an array of IDs and Names
    declare -a EMU_IDS
    declare -a EMU_NAMES
    
    while IFS= read -r line; do
        id=$(echo "$line" | awk -F'•' '{print $1}' | awk '{$1=$1;print}')
        name=$(echo "$line" | awk -F'•' '{print $2}' | awk '{$1=$1;print}')
        EMU_IDS+=("$id")
        EMU_NAMES+=("$name")
    done <<< "$EMULATORS_OUTPUT"
    
    for i in "${!EMU_IDS[@]}"; do
        echo "$((i+1)). ${EMU_NAMES[$i]} (${EMU_IDS[$i]})"
    done
    
    read -p "Enter the number of the emulator to launch: " SELECT_INDEX
    
    if ! [[ "$SELECT_INDEX" =~ ^[0-9]+$ ]] || [ "$SELECT_INDEX" -lt 1 ] || [ "$SELECT_INDEX" -gt "${#EMU_IDS[@]}" ]; then
        echo "Invalid selection."
        exit 1
    fi
    
    SELECTED_INDEX=$((SELECT_INDEX-1))
    SELECTED_EMULATOR=${EMU_IDS[$SELECTED_INDEX]}
    
    echo "Launching $SELECTED_EMULATOR..."
    fvm flutter emulators --launch "$SELECTED_EMULATOR"
    
    # Wait for device to appear
    echo "Waiting for emulator to connect..."
    while true; do
        sleep 2
        NEW_DEVICES=$(fvm flutter devices | grep -E "ios|android" | grep -v "macOS" | grep -v "Chrome")
        if [ -n "$NEW_DEVICES" ]; then
            echo "Emulator connected successfully!"
            break
        fi
    done
fi

echo "Running build_runner..."
fvm dart run build_runner build --delete-conflicting-outputs

echo "Running flutter..."
fvm flutter run
