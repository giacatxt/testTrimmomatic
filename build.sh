#!/bin/bash

# Install required packages
apt-get update
apt-get install -y python3-dev python3-pip
sudo apt install -y default-jre
sudo apt install -y default-jdk
# Download Trimmoatic
wget http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/Trimmomatic-0.39.zip
unzip Trimmomatic-0.39.zip
rm Trimmomatic-0.39.zip
chmod +x Trimmomatic-0.39/trimmomatic-0.39.jar

# Install Streamlit
pip3 install streamlit

pip3 install snakemake
