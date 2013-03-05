#!/bin/bash

function download() {
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
}

function compile() {
    chapters=$(cat PFTE.tex  | grep '^\\input' | grep -v common.tex | sed -e 's/^\\input{\([^}]*\)}.*$/\1/')

    for chapter in $chapters; do
        echo =========================================================
        echo COMPILING $chapter
        echo =========================================================

        # e.g., chapter = Zinc/Zinc.gut.tex

        file=$(basename $chapter) # e.g., Zinc.gut.tex
        file_gut=$(basename $chapter .tex) # e.g., Zinc.gut
        dir=$(dirname $chapter)

        echo "GutembergConsole generateSBALaTeXChapterFromPier: '${dir}/${file_gut}'. WorldState addDeferredUIMessage: [ SmalltalkImage current snapshot: true andQuit: true ]."

        # ./vm.sh Pharo.image eval

        # cd $dir # e.g., Zinc
        # pdflatex $file
        # pdflatex $file
        # cd ..
    done
}
