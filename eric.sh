#!/bin/sh

# Searches and imports shell library



function _main() {
    _compatibleVersion=$1

    _name[1]=shell.lib
    _hash[1]=3495faa48796ee2bc37eba138ff12c7a
    unset _name[0]
    unset _hash[0]

    n=$(echo ${#_hash[@]})
    echo "Newest Version: $n"
    echo "Name: ${_name[$n]}"
    echo "Hash: ${_hash[$n]}"

    cd $(dirname $0)

    _tmp=$(tempfile)

    while true; do
	echo "Searching $(pwd)..."

	find $(pwd) -type f -iname "*${_name[$n]}" | grep "${_name[$n]}" > $_tmp	
	if [ ! $? == 0 ]; then
	    if [ ! $(pwd) == "/" ]; then
		cd ..
	    else

# Add in loop for searching other names
		
		echo "Not found"
		exit 1
	    fi
	else
	    echo "Found! Locations:"
	    cat $_tmp
	    echo "Verifing..."
	    
	    while read line; do
		_hashV=$(md5sum $line | grep -oE "^[a-zA-Z0-9]*")
		
		for (( nV=0; nV<${#hash[@]}; nV++ )); do
		    if [ $_hashV == ${_hash[$nV]} ]; then
# Finish This
			echo ""
		    fi
		done

	    done < $_tmp
	fi
}

# main

_main
