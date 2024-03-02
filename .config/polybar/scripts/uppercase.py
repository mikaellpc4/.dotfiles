#!/usr/bin/env python3

import subprocess

# Run i3-msg to get the current mode
mode_output = subprocess.check_output(['i3-msg', '-t', 'get_binding_state'], universal_newlines=True)

# Extract the mode from the JSON output
mode = mode_output.strip().split('"')[3]

# Convert mode to uppercase if it's not "Default"
if mode != "default":
    uppercase_mode = mode.capitalize()  # Capitalize only the first letter
    print(uppercase_mode)
print(" ")
