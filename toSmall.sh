#!/bin/bash
#requires imagemagick
#try using `identify -format "%wx" image` if you want to explore filtering out
#images that are already small

smalldir=small
mkdir -p $smalldir
mkdir -p $smalldir/guests
mkdir -p $smalldir/flags
mkdir -p $smalldir/parrots

cp ./guests/HD/*.gif ./$smalldir/guests
cp ./flags/HD/*.gif ./$smalldir/flags
cp ./parrots/HD/*.gif ./$smalldir/parrots

shrinkem() {
  for f in *.gif; do convert $f -resize 25% $f; done;
}

cd ./$smalldir
cd guests
shrinkem

cd ../flags
shrinkem

cd ../parrots
shrinkem

cd ../../

# note: not all of these are small, unfortunately
cp ./parrots/*.gif ./$smalldir/parrots

echo "Your parrots have shrunk! Have a look inside the '$smalldir' directory."
