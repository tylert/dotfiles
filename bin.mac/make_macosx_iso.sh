#!/usr/bin/env bash

release='Mavericks'

app_path='/Users/tylertidman/Desktop'
app_name="Install OS X ${release}.app"
iso_name="Install_OS_X_${release}.iso"

# Mount the installer image
hdiutil attach "${app_path}/${app_name}/Contents/SharedSupport/InstallESD.dmg" -noverify -nobrowse -mountpoint /Volumes/install_app

# Convert the boot image to a sparse bundle
hdiutil convert /Volumes/install_app/BaseSystem.dmg -format UDSP -o "/tmp/${release}"

# Increase the sparse bundle capacity to accommodate the packages
hdiutil resize -size 8g "/tmp/${release}.sparseimage"

# Mount the sparse bundle for package addition
hdiutil attach "/tmp/${release}.sparseimage" -noverify -nobrowse -mountpoint /Volumes/install_build

# Remove Package link and replace with actual files
rm /Volumes/install_build/System/Installation/Packages
cp -rp /Volumes/install_app/Packages /Volumes/install_build/System/Installation/

# Copy ${release} installer dependencies
cp -rp /Volumes/install_app/BaseSystem.chunklist /Volumes/install_build/BaseSystem.chunklist
cp -rp /Volumes/install_app/BaseSystem.dmg /Volumes/install_build/BaseSystem.dmg

# Unmount the installer image
hdiutil detach /Volumes/install_app

# Unmount the sparse bundle
hdiutil detach /Volumes/install_build

# Resize the partition in the sparse bundle to remove any free space
hdiutil resize -size `hdiutil resize -limits "/tmp/${release}.sparseimage" | tail -n 1 | awk '{ print $1 }'`b "/tmp/${release}.sparseimage"

# Convert the sparse bundle to ISO/CD master
hdiutil convert "/tmp/${release}.sparseimage" -format UDTO -o "/tmp/${release}"

# Remove the sparse bundle
rm "/tmp/${release}.sparseimage"

# Rename the ISO and move it to the desktop
mv "/tmp/${release}.cdr" "${app_path}/${iso_name}"
