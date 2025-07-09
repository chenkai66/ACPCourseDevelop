#!/bin/bash

# Define variables
ENV_NAME="llm_learn"        # Name of the virtual environment
REPO_URL="https://github.com/AlibabaCloudDocs/aliyun_acp_learning.git"  # Git repository address
CLONE_DIR="alibabacloud_acp_learning"         # Directory name for cloned code
PYTHON_VERSION="3.10"           # Python version

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo "Python is not installed, please install Python $PYTHON_VERSION first"
    exit 1
fi

# Check if venv module is available
if ! python3 -c "import venv" &> /dev/null; then
    echo "The venv module is unavailable, please ensure your Python version supports venv"
    exit 1
fi

# Create a virtual environment (skip if it already exists)
if [ -d "$ENV_NAME" ]; then
    echo "Virtual environment '$ENV_NAME' already exists, skipping creation..."
else
    echo "Creating virtual environment '$ENV_NAME'..."
    python3 -m venv "$ENV_NAME" || { echo "Failed to create virtual environment"; exit 1; }
fi

# Activate the virtual environment
echo "Activating virtual environment '$ENV_NAME'..."
source "$ENV_NAME/bin/activate" || { echo "Failed to activate virtual environment"; exit 1; }

# Upgrade pip
echo "Upgrading pip..."
pip install --upgrade pip || { echo "Failed to upgrade pip"; exit 1; }

# Install ipykernel and register as Jupyter kernel (skip if already registered)
if jupyter kernelspec list | grep -q "$ENV_NAME"; then
    echo "Jupyter kernel '$ENV_NAME' already registered, skipping registration..."
else
    echo "Installing ipykernel and registering as Jupyter kernel..."
    pip install ipykernel || { echo "Failed to install ipykernel"; exit 1; }
    python -m ipykernel install --user --name "$ENV_NAME" --display-name "Python ($ENV_NAME)" || { echo "Failed to register Jupyter kernel"; exit 1; }
fi

# Pull code from Git
echo "Pulling code from Git into directory '$CLONE_DIR'..."
if [ -d "$CLONE_DIR" ]; then
    echo "Directory '$CLONE_DIR' already exists, skipping clone..."
else
    git clone "$REPO_URL" "$CLONE_DIR" || { echo "Git clone failed"; exit 1; }
fi

# Enter the code directory
echo "Entering code directory '$CLONE_DIR'..."
cd "$CLONE_DIR" || { echo "Failed to enter code directory"; exit 1; }

# Install dependencies
echo "Installing dependencies..."
if [ -f "requirements.txt" ]; then
    pip install -r requirements.txt || { echo "Failed to install dependencies"; exit 1; }
else
    echo "No requirements.txt file found, skipping dependency installation..."
fi

# Indicate completion and exit
echo "Operation completed! Virtual environment '$ENV_NAME' has been created and registered with Jupyter Notebook."

# Deactivate the virtual environment
deactivate