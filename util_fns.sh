function fileCheck() {
    local arrayCheck="$1[@]"
    local seeking=$2
    local in=0
    for element in ${!arrayCheck}
    do
        if [[ $element == $seeking ]]
        then
            in=1
            break
        fi
    done
    if [ $in -eq 1 ]
    then
        echo "IN"
    else
        echo "NOT IN"
    fi
}

function backupFiles() {
    local files2back="$1[@]"
    for file in ${!files2back}
    do
        if [ -f "$HOME/$file" ]; then
	        cp "$HOME/$file" "$HOME/$file_bk"
	        rm "$HOME/$file"
        fi
    done
}

function stripFirstTwo() {
    local word=$1
    local lenWord=${#word}
    echo ${word:2:lenWord - 2}
    #{string:position:length}
}

function createDirs() {
    local dirs2Create="$1[@]"
    for dir in ${!dirs2Create}
    do
        aux=$(stripFirstTwo $dir)
        path="$HOME/$aux/"
        if [ ! -d $path ]
        then
            mkdir $path
        fi
    done
}
