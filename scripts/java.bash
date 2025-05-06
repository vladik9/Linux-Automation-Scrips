#!/bin/bash
echo "################################################"
echo "Installing Java..."
sudo apt-get install java-common
sudo apt-get update;
sudo apt-get install -y java-21-amazon-corretto-jdk
sudo wget https://corretto.aws/downloads/latest/amazon-corretto-21-x64-linux-jdk.deb
sudo dpkg -i ./amazon-corretto-21-x64-linux-jdk.deb
java -version
echo "Java has been installed successfully."
echo "################################################"
