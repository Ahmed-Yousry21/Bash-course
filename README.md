# Web Server Setup and Management Scripts

This repository contains three bash scripts for setting up a web server on a VM, changing the IP address, and uninstalling the web server and its associated packages. These scripts are designed to automate the process of web server management.

## Scripts Overview

1. **web_server_setup.sh**
2. **change_ip.sh**
3. **uninstall_web_server.sh**

### 1. web_server_setup.sh

This script sets up a web server on a virtual machine. It performs the following tasks:

- Takes user inputs for the URL of a ZIP file containing the website files and the artifact name (last part of the URL without the .zip extension).
- Optionally changes the IP address of the VM.
- Installs necessary packages (`wget`, `unzip`, `httpd`).
- Starts and enables the `httpd` service.
- Downloads and unzips the website files, then copies them to `/var/www/html/`.
- Optionally updates the network configuration file with a new IP address.
- Cleans up temporary files.

### 2. change_ip.sh

This script changes the IP address of the VM. It performs the following tasks:

- Prompts the user to decide whether to change the IP address.
- If the user chooses to change the IP, the script updates the network configuration file with the new IP address and restarts the network service.

### 3. uninstall_web_server.sh

This script uninstalls the web server and removes all associated files. It performs the following tasks:

- Stops the `httpd` service.
- Deletes all files in `/var/www/html/`.
- Removes the `httpd`, `wget`, and `unzip` packages.

## Contributing

Feel free to contribute to this project by submitting pull requests or reporting issues.
