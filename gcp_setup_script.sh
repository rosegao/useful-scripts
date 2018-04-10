#!/bin/bash

### Update and install bzip2
sudo apt-get update
sudo apt-get --yes upgrade
sudo apt-get install bzip2

### Install Anaconda
mkdir downloads
cd downloads
wget https://repo.continuum.io/archive/Anaconda3-4.3.0-Linux-x86_64.sh
bash Anaconda3-4.3.0-Linux-x86_64.sh -b
echo 'export PATH=~/anaconda3/bin:$PATH' >> ~/.bashrc
export PATH=~/anaconda3/bin:$PATH
conda install -y bcolz
conda upgrade -y --all

### Start Jupyter notebook
# create config file
jupyter notebook --generate-config

# create certs for https
mkdir certs
cd certs
sudo openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout mycert.pem -out mycert.pem

cd ~
echo "c.NotebookApp.certfile = u'~/certs/mycert.pem'" >> ~/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.ip = '*'" >> $HOME/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.open_browser = False" >> $HOME/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.port = 8888" >> $HOME/.jupyter/jupyter_notebook_config.py

# Start Jupyter notebook
jupyter notebook