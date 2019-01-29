#!/bin/bash

# This is a simple CLI that finds and replaces user-specified strings at desired levels of recursion.
# README: https://github.com/tobylunt/sed_find_replace



#########
# Setup #
#########

# define input syntax for help message
usage() {
  echo "Usage: [ -r DEPTH ] [ -x EXTENSIONS ] find replace" 1>&2 
}

# check for missing options
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

# https://stackoverflow.com/questions/14513305/how-to-write-unix-shell-scripts-with-options
# https://www.computerhope.com/unix/bash/getopts.htm
while getopts ":x:r:" options; do 
    case $options in
        r)
	    DEPTH=${OPTARG}
	    ;;
	x)
	    FTYPES=${OPTARG}
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








#TEMP=`getopt -o vdm: --long verbose,debug,memory:,debugfile:,minheap:,maxheap: \
#             -n 'javawrap' -- "$@"`
#
#if [ $? != 0 ] ; then echo "Terminating..." >&2 ; exit 1 ; fi
#
## Note the quotes around `$TEMP': they are essential!
#eval set -- "$TEMP"
#
#VERBOSE=false
#DEBUG=false
#MEMORY=
#DEBUGFILE=
#JAVA_MISC_OPT=
#while true; do
#  case "$1" in
#    -v | --verbose ) VERBOSE=true; shift ;;
#    -d | --debug ) DEBUG=true; shift ;;
#    -m | --memory ) MEMORY="$2"; shift 2 ;;
#    --debugfile ) DEBUGFILE="$2"; shift 2 ;;
#    --minheap )
#      JAVA_MISC_OPT="$JAVA_MISC_OPT -XX:MinHeapFreeRatio=$2"; shift 2 ;;
#    --maxheap )
#      JAVA_MISC_OPT="$JAVA_MISC_OPT -XX:MaxHeapFreeRatio=$2"; shift 2 ;;
#    -- ) shift; break ;;
#    * ) break ;;
#  esac
#done



#################
## Find-replace #
#################
#
## record the in/out strings
#echo old string: $1
#echo new string: $2
#
## grep
#grep -rl $1 . --include \*.do | while read -r line ; do
#	printf "\n"
#	printf "Working on file:\n"
#	echo $line
#	sed -i "/$1/{
#        h
#        s//$2/g
#        H
#        x
#        s/\n/ >>> /
#        w /dev/fd/2
#        x
#        }" "$line"
#    done
#}
#
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
#
## a version that fixes tex files
#pcec_sed_tex () {
#    echo old string: $1
#    echo new string: $2
#    grep -rl $1 . --include \*.tex | while read -r line ; do
#	printf "\n"
#	printf "Working on file:\n"
#	echo $line
#	sed -i "/$1/{
#        h
#        s//$2/g
#        H
#        x
#        s/\n/ >>> /
#        w /dev/fd/2
#        x
#        }" "$line"
#    done
#}
#
#
#
###################
## Work out the CLI
###################
#
##
#read var1
#
#
#
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
