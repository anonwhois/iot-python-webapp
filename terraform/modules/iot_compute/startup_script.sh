#define temporary environment path variables
iot_directory="/home/sungwon_chung1/iot"
files_directory="/training-data-analyst/quests/iotlab/"
demo_directory="$iot_directory$files_directory"

#update the system information about Debian Linux package repositories
sudo apt-get update

#install in scope packages
sudo apt-get install python-pip openssl git git-core -y

#use pip for needed Python components
sudo pip install pyjwt paho-mqtt cryptography

#make a new directory
sudo mkdir $iot_directory

#add data to analyze
cd $iot_directory; git clone https://github.com/GoogleCloudPlatform/training-data-analyst.git

#create RSA cryptographic keypair
cd $demo_directory
sudo openssl req -x509 -newkey rsa:2048 -keyout rsa_private.pem \
-nodes -out rsa_cert.pem -subj "/CN=unused"

#download the CA root certificates from pki.google.com to the appropriate directory
sudo wget https://pki.google.com/roots.pem