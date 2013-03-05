#!/bin/bash

VM_URL="http://files.pharo.org/script/ciPharoVM.sh"
IMAGE_URL="https://ci.inria.fr/pharo-contribution/job/Pier3BookOnPharo20/lastSuccessfulBuild/artifact/Pier3BookOnPharo20.zip"

# Only use --no-check-certificate if supported
CERTCHECK="--no-check-certificate"
wget --help | grep -- "$CERTCHECK" 2>&1 > /dev/null || CERTCHECK=''

wget ${CERTCHECK} --output-document - $VM_URL | bash
wget ${CERTCHECK} --progress=bar:force --output-document=image.zip $IMAGE_URL

IMAGE_DIR="image"
mkdir $IMAGE_DIR

unzip -q -d $IMAGE_DIR image.zip

# find the image name
PHARO_IMAGE=`find $IMAGE_DIR -name '*.image'`
PHARO_CHANGES=`find $IMAGE_DIR -name '*.changes'`

# rename
mv "$PHARO_IMAGE" Pharo.image
mv "$PHARO_CHANGES" Pharo.changes

rm -rf image image.zip
