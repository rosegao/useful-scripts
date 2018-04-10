#!/bin/bash

# Update and install bzip2
sudo apt-get update
sudo apt-get --yes upgrade
sudo apt-get install bzip2

# Install Anaconda
mkdir downloads
cd downloads
wget https://repo.continuum.io/archive/Anaconda3-4.3.0-Linux-x86_64.sh
bash Anaconda3-4.3.0-Linux-x86_64.sh -b


echo 'export PATH=~/anaconda3/bin:$PATH' >> ~/.bashrc
export PATH=~/anaconda3/bin:$PATH
conda install -y bcolz
conda upgrade -y --all

# Config Jupyter notebook
mkdir notebooks
cd notebooks
jupyter notebook --generate-config
echo "c.NotebookApp.ip = '*'" >> $HOME/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.open_browser = False" >> $HOME/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.port = 8888" >> $HOME/.jupyter/jupyter_notebook_config.py

# Start Jupyter notebook
jupyter notebook