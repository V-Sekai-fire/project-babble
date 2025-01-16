#!/bin/bash

# Check if running on a supported operating system
if [[ "$OSTYPE" != "linux-gnu"* ]] && [[ "$OSTYPE" != "darwin"* ]]; then    
    echo "Error: This script is only compatible with Linux and macOS operating systems."    
    exit 1
fi

# Check Python version
if ! command -v python3 &> /dev/null; then    
    echo "Error: Python is not installed. Please install Python 3.8 or higher."    
    exit
fi  
    
python_version_major=$(python3 -c 'import platform; print(platform.python_version_tuple()[0])')
python_version_minor=$(python3 -c 'import platform; print(platform.python_version_tuple()[1])')
if (( python_version_major < 3 || python_version_minor < 8 )); then    
    echo "Error: Your Python version is too low! Please install 3.8 or higher."    
    exit 1
fi

install_dir="$HOME/.local/share/project-babble"
bin_dir="$HOME/.local/bin"

# Create installation directory if it doesn't exist
mkdir -p "$install_dir"

# Function to install requirements
install_requirements() {
    cd "$install_dir"
    cd BabbleApp
    echo "Installing requirements..."
    pip install -r requirements.txt --quiet
    rm requirements.txt
}

cp -r . "$install_dir"
cd "$install_dir"
cd BabbleApp

# Create venv if it does not exists
if ! [ -d "venv" ]; then
    python3 -m venv venv
fi

source venv/bin/activate  
echo "Verifying dependencies. This might take a second!"
install_requirements
echo "Starting Babble app..."
python3 babbleapp.py