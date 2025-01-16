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
if (( python_version_major < 3 || python_version_minor < 9 )); then    
    echo "Error: Your Python version is too low! Please install 3.9 or higher."    
    exit 1
fi

install_dir="$HOME/.local/share/project-babble"
bin_dir="$HOME/.local/bin"

mkdir -p "$install_dir"

install_requirements() {
    cd "$install_dir"
    cd BabbleApp
    echo "Installing requirements..."
    pip install -r requirements.txt --quiet
    rm requirements.txt
}

rm -rf ~/.local/share/project-babble
cp -r . "$install_dir"
cd "$install_dir"
cd BabbleApp

if ! command -v micromamba &> /dev/null; then
    echo "Installing micromamba..."
    if [[ "$OSTYPE" == "darwin"* ]]; then
        if [[ "$(uname -m)" == "arm64" ]]; then
            micromamba_url="https://micromamba.snakepit.net/api/micromamba/osx-arm64/latest"
        else
            micromamba_url="https://micromamba.snakepit.net/api/micromamba/osx-64/latest"
        fi
    else
        micromamba_url="https://micromamba.snakepit.net/api/micromamba/linux-64/latest"
    fi
    curl -L "$micromamba_url" | tar -xvj bin/micromamba
    mkdir -p ~/micromamba/bin
    mv bin/micromamba ~/micromamba/bin/
    rm -rf bin
    export PATH="$HOME/micromamba/bin:$PATH"
fi

if [ ! -d "mamba-env" ]; then
    echo "Creating micromamba environment with Python 3.10..."
    micromamba create -y -n babble-env python=3.10
fi

eval "$(micromamba shell hook -s bash)"
micromamba activate -n babble-env

echo "Verifying dependencies. This might take a second!"
install_requirements
echo "Starting Babble app..."
python3 babbleapp.py