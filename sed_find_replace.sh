#!/bin/bash

# This is a simple CLI that finds and replaces user-specified strings at desired levels of recursion.
# README: https://github.com/tobylunt/sed_find_replace



#########
# Setup #
#########

# define input syntax for help message
usage() {
  echo "Usage: [ -d MAXDEPTH ] [ -x EXTENSIONS ]  [ -a ACCEPT_ALL ] find replace" 1>&2 
}

# check for missing arguments
if [ $# -eq 0 ]
then
        echo "Missing options!"
        echo "(run $0 -h for help)"
        usage
        exit 0
fi


################
# Read options #
################

# initialize our variables as missing
DEPTH=
FTYPES=
ACCEPT=false

# https://www.computerhope.com/unix/bash/getopts.htm
# add the options to variables with getopts. note that option a does not get any arguments.
while getopts ":x:d:a" options; do 
    case $options in
        d)
	    DEPTH=${OPTARG}
	    ;;
	x)
	    FTYPES=${OPTARG}
	    ;;
	a)
	    ACCEPT=true
	    ;;
    esac
done


# shift the remaining non-option arguments (the find and replace strings)
shift $(($OPTIND - 1))
first_arg=$1
second_arg=$2

# Check for input argument count (aside from options)
if [ "$#" -ne 2 ]; then
    echo "Arguments are not equals to 2"
    usage
    exit 1
fi

# configure depth if the option is not missing
if [ -n "$DEPTH" ]; then

    # Check for insufficient depth argument
    if (( $DEPTH < 1 )); then
        echo "Recursion depth must be > 0"
        usage
        exit 1
    fi

    # set the sed option
    DEPTH=" -maxdepth $DEPTH "
fi

# configure filetypes if the option is not missing
if [ -n "$FTYPES" ]; then

    # scrub any stars, dots, or slashes
    FTYPES=${FTYPES//.}
    FTYPES=${FTYPES//\*}

    # adjust the cleaned extensions to match grep syntax
    FTYPES=--include=\*.${FTYPES// / --include=\*.}
fi



#################
## Find-replace #
#################

# record the in/out strings
echo old string: $1
echo new string: $2

# begin the f/r command. find filenames to the correct depth, and grep
# for the input string matching the correct file extensions
find . -type f $DEPTH -exec grep -l $FTYPES -e $1 {} + | while read -r line ; do

    # strip leading './' from find output
    line=${line#.\/}
    
    # print out the file being considered
    printf "\n\n###################################################\n"
    printf "Working on file: $line"
    printf "\n###################################################\n\n"

    # check if we've got the 'accept-all' option. this won't spit out
    # a request for approval.
    if [ "$ACCEPT" = false ] ; then

	# run the sed command without making any changes to disk, for
	# the user to preview what will happen. -n suppresses doubled
	# output from the sed pattern space
        sed -n "/$1/{
            h 
            s//$2/g 
            H 
            x 
            s/\n/ >>> / 
            w /dev/fd/2
            }" "$line"
	
	# check if the user wants to execute this command. note that
	# the read command requires a separate source from the above
	# read running the while loop, so we use the controlling
	# terminal /dev/tty
	read -p "Do you wish to make this replacement?" yn </dev/tty
	case $yn in
	    [Yy]* )

		# if yes, run a quiet sed inplace
		sed -i '' "s/$1/$2/g" "$line"
		;;

	    # if not, continue to the next line
	    [Nn]* ) continue;;

	    # catch incorrect entries
	    * ) echo "Please answer yes or no.";;
	esac
    elif [ "$ACCEPT" = true ] ; then

        # if the user doesn't want previews, execute all the inplace
        # sed commands. "i ''" ensures this works on MacOS
        sed -i '' "/$1/{
            h
            s//$2/g
            H
            x
            s/\n/ >>> /
            w /dev/fd/2
            x
            }" "$line"
    fi
done


## a version that enters a trailing space
#pcec_sed_trailspace () {
#    echo old string: $1
#    echo new string: $2
#    grep -rl $1 . --include \*.do | while read -r line ; do
#	printf "\n"
#	printf "Working on file:\n"
#	echo $line
#	sed -i "/$1/{
#        h
#        s//$2 /g
#        H
#        x
#        s/\n/ >>> /
#        w /dev/fd/2
#        x
#        }" "$line"
#    done
#}


#####################
## deployment example
#####################
#
## make sure we are in the directory we want to sed within (recursively)
#cd ~/iecmerge
#
## set strings
#old_file_string='iec2\/secc\/mord_final'
#new_file_string='iec2\/secc\/final'
#
## test grep
#grep -r "$old_file_string" . --exclude-dir=.svn 
#
## sed for do files
#pcec_sed $old_file_string $new_file_string
#
## sed for tex files
#pcec_sed_tex $old_file_string $new_file_string
#
