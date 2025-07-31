# yireo-webp-2-shell-scripts
This repository contains shell scripts that can help with generating and removing webp images for future use with the Yireo_Webp2 module for Magento 2 ( https://github.com/yireo/Yireo_Webp2 )
When using the Yireo_WebP module, you can create an excessive load on the server after installation if there is high traffic on the project. This is because, as part of processing a request via the M2 application, a service trigger is executed to convert images.
With high traffic, this can lead to significant loads with a large number of requests, or to server failure.
To avoid this, a script was provided to pre-generate all images so that the application does not have to process them all at startup.

# Installation: 
Copy the repository files to the root folder with magento 2 project

# Additional:
Due to the specifics of the module's operation, a situation may arise where there is a collision of image names.
If there are two images with the same name but different formats in the same folder
`image.png`
`image.jpg`
You also need to install this patch (so that the same hashing algorithm is used in CLI and M2). Source : `<repo-root>/m2-patch.patch`

Before rendering, the functionality will check whether there is an image.webp file in the folder next to image.png. If not, it will convert `image.png` to `image.webp`.
Then, when processing `image.jpg`, it will also check whether there is an `image.webp` file in the folder, and it will already be there. However, it will be a different image.
To avoid this situation, you need to enable the config in the admin panel (Add hashes to Images).

And use the scripts `web-convert-all-with-hashes.sh` and `webp-remove-all-with-hashes.sh`, respectively.

# Usage 
1. For correct operation, you need to set script execution permission ( ```chmod u+r+x <script_name.sh>``` ).
2. Create a backup of media files ( pub/media folder ) on the environment.
3. Install cwebp on the environment. https://developers.google.com/speed/webp/docs/using
4. ```webp-contert-all.sh``` / ```web-convert-all-with-hashes.sh```
The script allows to convert all images to webp. Important: all conversion settings should be customized only by editing the script itself ( by default - converted picture is placed in the folder next to the source, conversion quality - 80 ).
You can also use this script on a high-traffic site during "off" hours, before the module is enabled and installed. In order that in the future there was no significant delay on the site due to the work of php scripts and the converter itself, when the site is loaded with traffic and conversion on the fly
5. ```webp-remove-all.sh``` / ```webp-remove-all-with-hashes.sh```
This script allows you to remove all .webp images that were generated using the functionality of the Yireo_Webp2 module, or using the .sh script above. Only those images will be deleted that have a .png/.jpg/.jpeg format source in the folder where they are located ( file name matching ).
This can be useful if you want to change any conversion parameters (because initially the module does not allow you to overwrite an existing picture when changing configurations).
