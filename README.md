### Wordpress Installation Automation using Bash Script
Wordpress: Bash Install Script based on WP-CLI (http://wp-cli.org) -- Downloads latest WP version, updates wp-config, create Users, Install Plugins and Install themes automatically.

This script is to automate day to day wordpress installation activities. You can customize the script according to your needs. 

This script will automate the following:
1. Downlaod and install Wordpress automatically
2. Create Default Users with passwords
3. Install all default plugins
4. Install the default or custom theme by zip url you mostly used.

**Note:** If you have custom plugins or paid plugins then you can download zip file for those plugins and upload it to your server and get the url of the zip file and can paste the zip file url under installPlugin function in order to automate the installation of plugins. Same for themes.

####Steps to Install:
1. You should have wp-cli.org installed on your machine
2. Copy the install.sh file anywhere in your machine and edit the file
3. Change all the required variables value in Install.sh file like installation directory etc.
4. Run install.sh file by typing command in your shell sh install.sh
5. Now it will asks you to choose options like 1,2,3 so you can choose the desired options.

**NOTE:**
Any questions feel free to contact me via email or create an issue on github.

