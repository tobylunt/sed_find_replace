# Find and replace utility

![Find-replace](https://github.com/tobylunt/sed_find_replace/raw/master/map/static/fr_example.gif "tutorial")

This utility finds an input string and replaces it with a new string within all text files of the current directory, and any levels of subdirectories as specified. It shows you the original and replacement of each line with a change.

Have you ever had to modify a large codebase when you realized you had a poorly named dataset or variable mucking up your life? Have you dreaded breaking things you haven't touched in months by ripping through your code with `sed`?

Even under version control, large-scale find and replace can be a pain in the butt and a little nerve-wracking. This little utility helps the process by highlighting each individual *complete* line change, so you can visually confirm that your replacement code doesn't have unintended consequences.

The backbone of the utility is the extraordinarily powerful `GNU sed`. Thanks. This just makes it a little easier and a little less terrifying to use.

Keeping your code under version control is strongly recommended before using this utility.

## How to use

This is under development and is currently not executable. Ultimately you will download the sed_find_replace.sh and add it to your path, then use the `sed_find_replace "old_string" "new string"` format.

Options (flags) will include:

* `--accept-all`: Accept all changes (output for each line's replacement will still be printed). Default is to prompt the user to accept or reject each change.
* `--recurse`: Desired depth of recursion into subfolders. E.g. `-r=1` will search pwd and one level of subfolders. `-r` give full recursion. Default is no recursion.
* `--target`: Define file extensions for the script to consider, e.g. `--target=".py .sh"`
* `--filelist`: Specify an external .txt file with all target files individually specified by file/filepaths on their own line. E.g. `--filelist="~/Desktop/infiles.txt"`
* `--exclude-dir`: Specify a directory to exclude, e.g. `--exclude-dir=.svn`



## Features I might add

* Output stats, e.g. total files matching input string, total lines replaced

## Other options

You could check out [FAR](http://findandreplace.sourceforge.net/) (for "find and replace"). Seems great! Not a command line utility though. I actually haven't used it.

There are other GUI options out there as well. My favorite is probably the cleverly named [FART](http://fart-it.sourceforge.net/).

## Acknowledgements

I wrote the first draft of these functions while working for [Sam Asher](https://samuelasher.com/) and [Paul Novosad](https://www.dartmouth.edu/~novosad/), who were gracious enough to encourage me to continue to develop it into a utility and make it open source. Thanks a ton.






for each pc01 town above a pop threshold (e.g. 10k) or flagged as a town:
- this pc01 town substantially overlaps multiple constituencies - drop shrid, and flag those constituencies to be dropped at the end (do we want a pop percentage?) get pop totals by pieces.
- this pc01 town matches the exact constituency. need to get matching constituency number/name, and pop.

clean out addititional info out of the name, but put it in a new field
strip out G.Ps and C.D. blocks and see what you have left
watch out for OGs, MC, CT
start with full list of bihar census towns, rather than everythign over 10k or whatever. take 2001 urban PCA and match from there.