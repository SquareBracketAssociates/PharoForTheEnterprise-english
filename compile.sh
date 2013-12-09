#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

VM_EXECUTABLE=./pharo

function pillar_all() {
    echo 'pillar'
    $VM_EXECUTABLE Pharo.image eval <<EOF
| conf |
conf := PRSTONExportConfiguration fromFile: '${PWD}/pillar-conf.ston' asFileReference.
conf export: 'LaTeX whole book'.
conf export: 'LaTeX by chapter'.
conf export: 'HTML by chapter'.
conf export: 'Markdown by chapter'.
Smalltalk snapshot: false andQuit: true.
EOF

}

function pillar_one() {
    echo "No yet implemented" >&2
    exit 1
}

function mypdflatex() {
    pier_file="$1"

    echo "Compiling PDF..."
    pdflatex -halt-on-error -file-line-error -interaction batchmode "$pier_file" 2>&1 1>/dev/null
    ret=$?
    if [[ $ret -ne 0 ]]; then
        cat $pier_file.log
        echo "Can't generate the PDF!"
        exit 1
    fi
}

function produce_pdf() {
    dir="$1"
    pier_file="$2"

    cd "$dir"         # e.g., cd Zinc/
    mypdflatex "$pier_file" && mypdflatex "$pier_file"
    cd ..
}

function compile() {
    dir="$1"
    pier_file="$2"

    produce_pdf "${dir}" "${pier_file}"
}

function compile_chapters() {
    chapters=$(cat PFTE.tex  | grep '^\\input' | grep -v common.tex | sed -e 's/^\\input{\([^}]*\)}.*$/\1/')

    for chapter in $chapters; do
        echo =========================================================
        echo COMPILING $chapter
        echo =========================================================

        # e.g., chapter = Zinc/Zinc.pier.tex

        pier_file=$(basename $chapter .tex) # e.g., Zinc.pier
        dir=$(dirname $chapter) # e.g., Zinc

        compile "${dir}" "${pier_file}"
    done
}

if [[ $# -eq 1 ]]; then
    dir=$(dirname "$1") # e.g., Zinc
    pier_file=$(basename "$1") # e.g., Zinc.pier
    pillar_one "${pier_file}"
    compile "${dir}" "${pier_file}"
else
    pillar_all
    compile_chapters
fi
