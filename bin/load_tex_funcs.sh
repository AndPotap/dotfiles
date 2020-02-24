#!/bin/bash

build_file () {
    pdflatex $1.tex && bibtex $1.aux && pdflatex $1.tex && pdflatex $1.tex && clear
}

clean_tex_aux () {
    local aux=(.log .aux .bbl .blg .out)
    for a in ${aux[@]}
    do
        echo "*$a"
        hits=($(find ./ -maxdepth 1 -name "*$a"))
        if [ ${#hits[@]} -gt 0 ]
        then
            rm *$a
        fi
    done
}
