#!/bin/bash

# Exit on error
set -e

# Check if Python 3 is installed
if ! command -v python3 &> /dev/null; then
    echo "❌ Python 3 is not installed. Please install Python 3.8 or higher."
    exit 1
fi

# Create a virtual environment
echo "🔄 Creating virtual environment..."
python3 -m venv .venv

# Activate the virtual environment
echo "✅ Virtual environment created. Activating..."
source .venv/bin/activate

# Upgrade pip
echo "🔄 Upgrading pip..."
pip install --upgrade pip

# Install requirements
echo "📦 Installing required packages..."
pip install -r requirements.txt

# Install Jupyter extensions
echo "🔌 Setting up Jupyter extensions..."
pip install jupyter_contrib_nbextensions
jupyter contrib nbextension install --user

# Install Jupyter kernel
echo "📊 Registering Jupyter kernel..."
python -m ipykernel install --user --name=parcial1_visualizacion --display-name="Python (Parcial1 Visualización)"

echo "\n🎉 Environment setup complete!"
echo "To activate the virtual environment, run:"
echo "source .venv/bin/activate"
echo "\nTo start Jupyter notebook:"
echo "jupyter notebook"

echo "\nTo deactivate the virtual environment when done, run:"
echo "deactivate"

# Make the script executable
chmod +x setup_environment.sh
