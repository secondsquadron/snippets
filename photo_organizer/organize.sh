#!/bin/bash

# Small script which creates directories based on file dates and links the appropriate files into them.
# Useful when you have a lot of images from camera but you want to process only photos from an event.
# Additional feature to rename directories so their name include the number of files they contain.

# create temp script
touch generated.sh
chmod +x generated.sh

# frist part create the directories and do the linking
echo "#!/bin/bash" > generated.sh
ls -la --full-time IM*| awk '{print "mkdir -p "$6}' >> generated.sh
ls -la --full-time IM*| awk '{print "ln -s `pwd`/"$9" -t "$6}' >> generated.sh
echo "Creating directories and linking"
./generated.sh

# second part do the renaming of the dirs
echo "#!/bin/bash" > generated.sh
find . -type d -name "2*" | xargs -Iitem echo 'mv item item_`ls -l item/* | wc -l`' >> generated.sh
echo "Renaming directories"
./generated.sh

# clean up
rm generated.sh
echo "Bye"

