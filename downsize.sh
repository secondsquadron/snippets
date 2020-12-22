#!/bin/sh

# find all jpgs and convert them to third size and quality
find . -name "*.jpg" | xargs -I item convert -resize 30% -quality 30 item item_

# rename downsized jpgs
rename 's/\.jpg_/_\.jpg/' *.jpg_
