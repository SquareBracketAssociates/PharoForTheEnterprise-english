#!/bin/bash

chapters=$(cat PFTE.tex  | grep '^\\input' | grep -v common.tex | sed -e 's/^\\input{\([^}]*\)}.*$/\1/')

for chapter in $chapters; do
    echo =========================================================
    echo COMPILING $chapter
    echo =========================================================

    # e.g., chapter = Zinc/Zinc.pier.tex

    file=$(basename $chapter) # e.g., Zinc.pier.tex
    file_pier=$(basename $chapter .tex) # e.g., Zinc.pier
    dir=$(dirname $chapter) # e.g., Zinc

    echo "GutembergConsole generateSBALaTeXChapterFromPier: '${dir}/${file_pier}'. WorldState addDeferredUIMessage: [ SmalltalkImage current snapshot: true andQuit: true ]." | ./vm.sh Pharo.image eval
    echo "GutembergConsole generateStandaloneHTMLFromPier: '${dir}/${file_pier}'. WorldState addDeferredUIMessage: [ SmalltalkImage current snapshot: true andQuit: true ]." | ./vm.sh Pharo.image eval

    cd $dir         # e.g., cd Zinc/
    pdflatex $file
    pdflatex $file
    cd ..
done
