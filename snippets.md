# Snippets

Some snippets I need(ed) sometimes. I find it more useful to collect these rather than (re)search them every time.

## Git related

### config git
```
git config --global user.name "Your Name"
git config --global user.email "youremail@yourdomain.com"
```
### modify commits
```
# change commits
git rebase -i -p <commit>   # OR git rebase -i --root
# edit 'pick' to 'edit' at the commits to be edited

git commit --amend OR to change author
git commit --amend --author="username <email@address>" --no-edit
git rebase --continue

# because of change of history, push will fail, force if you don't mind to lose history (beware if you have releases or other things which are linked to certain commit ids)
git push --force
```
## Other

### debian netinst from usb stick
>Choose UEFI USB key in BIOS to boot USB, installer will install UEFI GRUB

### superblock error after win10
> "I have done some research and it seems that since ext2fsprogs 1.43 (Ubuntu 16.10), the 64bit and the metadata_csum features are enabled when a new ext4 filesystem is created. I did a fresh install of Ubuntu 16.10, but before installing, I started into the USB live session and removed the 64bit and metadata_csum features for ext4 from /etc/mke2fs.conf. After this I ran the installer out of the this live session and now I can start Windows 10 without corrupting my ext4 partitions (you have to reformat your ext4 partitions during the installation of Ubuntu 16.10)."

> "The problem is related to ext2fsd which obviously does not support the 64bit feature and/or metadata_csum feature. It is sufficient to have ext2fsd installed to corrupt your ext4 partitions. No need for them to be mounted in Windows."

> "You can check if these features are enabled with the following command:"

`sudo tune2fs -l /dev/[sdXX]`

### qt native gtk theme
```
sudo apt install qt5-style-plugins
echo "export QT_QPA_PLATFORMTHEME=gtk2" >> ~/.profile
```
### firefox dpi setting
>type **about:config** into the Firefox’s address bar
find the **layout.css.devPixelsPerPx** key

### Convert a pdf file to PDF/A (pdf archive) format
```
ghostscript -dPDFA -dBATCH -dNOPAUSE -sColorConversionStrategy=UseDeviceIndependentColor -sDEVICE=pdfwrite -dPDFACompatibilityPolicy=1 -sOutputFile=<in.pdf> <out.pdf>
```

### Unpack and repack a debian package
```
# debian package unpack and repack
mkdir tmp
dpkg-deb -R original.deb tmp
# edit dependency or other things
dpkg-deb -b tmp fixed.deb
```
