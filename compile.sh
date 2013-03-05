#!/bin/bash

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
