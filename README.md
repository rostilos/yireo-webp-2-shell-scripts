# yireo-webp-2-shell-scripts
This repository contains shell scripts that can help with generating and removing webp images for future use with the Yireo_Webp2 module for Magento 2 ( https://github.com/yireo/Yireo_Webp2 )

# Installation: 
Copy the repository files to the root folder with magento 2 project

# Usage 
1. For correct operation, you need to set script execution permission ( chmod u+r+x <script_name.sh> ).
2. Create a backup of media files ( pub/media folder ) on the environment.
3. Install cwebp on the environment. https://developers.google.com/speed/webp/docs/using
4. ```webp-contert-all.sh```
The script allows to convert all images to webp. Important: all conversion settings should be customized only by editing the script itself ( by default - converted picture is placed in the folder next to the source, conversion quality - 80 ).
You can also use this script on a high-traffic site during "off" hours, before the module is enabled and installed. In order that in the future there was no significant delay on the site due to the work of php scripts and the converter itself, when the site is loaded with traffic and conversion on the fly
5. ```webp-remove-all.sh```
This script allows you to remove all .webp images that were generated using the functionality of the Yireo_Webp2 module, or using the .sh script above. Only those images will be deleted that have a .png/.jpg/.jpeg format source in the folder where they are located ( file name matching ).
This can be useful if you want to change any conversion parameters (because initially the module does not allow you to overwrite an existing picture when changing configurations).
