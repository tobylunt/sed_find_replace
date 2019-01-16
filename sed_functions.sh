# this code runs seds to look for, and replace, instances of keys that
# are getting moved and renamed. see the memo in dropbox: "2018-10-22
# TL reorganize EC PC keys.docx"

# note that this is not a script meant to be run start to finish
# (hence no shebang). this was run line by line in your emacs shell so
# i could see what's going on. also this should never be run again,
# only need to make these moves once.

# see don_cristi's comment for more info on this sed technique: https://unix.stackexchange.com/questions/97297/how-to-report-sed-in-place-changes


##########
# setup
##########

# establish the sed function
pcec_sed () {
    echo old string: $1
    echo new string: $2
    grep -rl $1 . --include \*.do | while read -r line ; do
	printf "\n"
	printf "Working on file:\n"
	echo $line
	sed -i "/$1/{
        h
        s//$2/g
        H
        x
        s/\n/ >>> /
        w /dev/fd/2
        x
        }" "$line"
    done
}

# a version that enters a trailing space
pcec_sed_trailspace () {
    echo old string: $1
    echo new string: $2
    grep -rl $1 . --include \*.do | while read -r line ; do
	printf "\n"
	printf "Working on file:\n"
	echo $line
	sed -i "/$1/{
        h
        s//$2 /g
        H
        x
        s/\n/ >>> /
        w /dev/fd/2
        x
        }" "$line"
    done
}

# a version that fixes tex files
pcec_sed_tex () {
    echo old string: $1
    echo new string: $2
    grep -rl $1 . --include \*.tex | while read -r line ; do
	printf "\n"
	printf "Working on file:\n"
	echo $line
	sed -i "/$1/{
        h
        s//$2/g
        H
        x
        s/\n/ >>> /
        w /dev/fd/2
        x
        }" "$line"
    done
}



####################
# deployment example
####################

# make sure we are in the directory we want to sed within (recursively)
cd ~/iecmerge

# set strings
old_file_string='iec2\/secc\/mord_final'
new_file_string='iec2\/secc\/final'

# test grep
grep -r "$old_file_string" . --exclude-dir=.svn 

# sed for do files
pcec_sed $old_file_string $new_file_string

# sed for tex files
pcec_sed_tex $old_file_string $new_file_string
