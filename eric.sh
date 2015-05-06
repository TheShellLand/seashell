#!/bin/bash; 

# Searches and imports shell library; 



function _findariel() {
    export _pwd="$(pwd)";
    _cV=$1;
    `# Compatible Version`;
    _name[1]=ariel.lib;
    _hash[1]=4052bd6a155b42fe2a7ff38f3679dfde;
    _name[2]=ariel.lib;
    _hash[2]=763263796ba740ab5d3e7275b5fe70f0;
    unset _name[0];
    unset _hash[0];
    _nV=$(echo ${#_hash[@]});
    `# Newest Version`;
    echo "== ariel finder ===================================";
    echo "";
    echo "Newest Version: $_nV";
    echo "Name: ${_name[$_nV]}";
    echo "Hash: ${_hash[$_nV]}";
    echo "";
    if [ ! -z "$_cV" ];
    then if [ ! "$_cV" -gt ${#_hash[@]} ];
	 then echo "Compatible Version: $_cV";
	      echo "Name: ${_name[$_cV]}";
	      echo "Hash: ${_hash[$_cV]}";
	      echo "";
	 else echo "The compatible version is newer than what Eric knows";
	      echo "Please find a better Eric. Good bye";
	      exit 1;
	 fi;
    else _cV=$_nV;
    fi;
    cd $(dirname $0);
    _tmp=$(tempfile);
    while true;
    do echo "Searching $(pwd)...";
       find $(pwd) -type f -iname "*${_name[$_cV]}" 2>/dev/null | grep "${_name[$_cV]}" > $_tmp;
       if [ ! $? == 0 ];
       then `# Loop`;
	    if [ ! $(pwd) == "/" ];
	    then cd ..;
	    fi;
       else while read line;
	    do echo "Found!";
	       echo "Verifing...";
	       _hashV=$(md5sum "$line" | grep -oE "^[a-zA-Z0-9]*");
	       `# Hash of found versions`;
	       if [ "$_hashV" == "${_hash[$_cV]}" ];
	       then echo "Compatible: $_hashV $line";
		    export _ariel=$line;
		    echo "";
		    echo "== END ariel finder ===============================";
		    return 0;
	       else echo "Not Compatible: $_hashV $line";
		    cd ..;
	       fi;
	    done < $_tmp;
	    if [ $(pwd) == "/" ];
	    then echo "Ariel cannot be found";
		 echo "You have no library on this system. Good bye";
		 echo "";
		 echo "== END ariel finder ===============================";
		 exit 1;
	    fi;
       fi;
    done;
};

`## You want to copy these three lines to the beginning of all your other functions()`; 
`#_findariel 1 || exit 1`; 
`#. $_ariel || exit 1`; 
`#cd $_pwd`; 


function _findariel() { export _pwd="$(pwd)";_cV=$1;`# Compatible Version`;_name[1]=ariel.lib;_hash[1]=4052bd6a155b42fe2a7ff38f3679dfde;_name[2]=ariel.lib;_hash[2]=763263796ba740ab5d3e7275b5fe70f0;unset _name[0];unset _hash[0];_nV=$(echo ${#_hash[@]});`# Newest Version`;echo "== ariel finder ===================================";echo "";echo "Newest Version: $_nV";echo "Name: ${_name[$_nV]}";echo "Hash: ${_hash[$_nV]}";echo "";if [ ! -z "$_cV" ];then if [ ! "$_cV" -gt ${#_hash[@]} ];then echo "Compatible Version: $_cV";echo "Name: ${_name[$_cV]}";echo "Hash: ${_hash[$_cV]}";echo "";else echo "The compatible version is newer than what Eric knows";echo "Please find a better Eric. Good bye";exit 1;fi;else _cV=$_nV;fi;cd $(dirname $0);_tmp=$(tempfile);while true;do echo "Searching $(pwd)...";find $(pwd) -type f -iname "*${_name[$_cV]}" 2>/dev/null | grep "${_name[$_cV]}" > $_tmp;if [ ! $? == 0 ];then `# Loop`;if [ ! $(pwd) == "/" ];then cd ..;fi;else while read line;do echo "Found!";echo "Verifing...";_hashV=$(md5sum "$line" | grep -oE "^[a-zA-Z0-9]*");`# Hash of found versions`;if [ "$_hashV" == "${_hash[$_cV]}" ];then echo "Compatible: $_hashV $line";export _ariel=$line;echo "";echo "== END ariel finder ===============================";return 0;else echo "Not Compatible: $_hashV $line";cd ..;fi;done < $_tmp;if [ $(pwd) == "/" ];then echo "Ariel cannot be found";echo "You have no library on this system. Good bye";echo "";echo "== END ariel finder ===============================";exit 1;fi;fi;done;};


# main; 

_findariel || exit 1; 
. $_ariel || exit 1; 
cd $_pwd; 
