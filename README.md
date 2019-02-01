# Find and replace utility v1.0

![Find-replace](https://github.com/tobylunt/sed_find_replace/raw/master/fr_example.gif "tutorial")

**_WARNING: use of version control with this utility is highly recommended!_**

This utility finds an input string and replaces it with a new string within all text files of the current directory, and any levels of subdirectories as specified. It shows you the original and replacement of each line with a change.

Have you ever had to modify a large codebase when you realized you had a poorly named dataset or variable mucking up your life? Have you dreaded breaking things you haven't touched in months by ripping through your code with `sed`?

Even under version control, large-scale find and replace can be a pain in the butt and a little nerve-wracking. This little utility helps the process by highlighting each individual *complete* line change, so you can visually confirm that your replacement code doesn't have unintended consequences.

The backbone of the utility is the extraordinarily powerful `GNU sed`. Thanks. This just makes it a little easier and a little less terrifying to use.

## How to use

Download the sed_find_replace.sh and add it to your path. You may need to `chmod +x` to ensure it is executable. This was originally developed on RHEL but finalized on MacOX, so it should work on both.

```Usage: [ -d MAXDEPTH ] [ -x EXTENSIONS ]  [ -a ACCEPT_ALL ] [ -r RECURSE_FULL ] find_string replace_string```

Options:

* `-d`: Maximum depth of recursion into subfolders. E.g. `-d=1` will only search within the current directory. Default is no recursion.
* `-r`: Full recursion through all subdirectories.
* `-a`: Accept all changes without prompt (output for each line's replacement will still be printed). Default is to prompt the user to accept or reject each change.
* `-x`: Define file extensions for the script to consider, e.g. `-x ".py .sh"`, `-x "*.py *.sh"`, or `-x "py sh"`

Potential future options:

* `--filelist`: Specify an external .txt file with all target files individually specified by file/filepaths on their own line. E.g. `--filelist="~/Desktop/infiles.txt"`
* `--exclude-dir`: Specify a directory to exclude, e.g. `--exclude-dir=.svn`



## Features I might add

* Output stats, e.g. total files matching input string, total lines replaced

## Other similar utilities

You could check out [FAR](http://findandreplace.sourceforge.net/) (for "find and replace"). Seems great! Not a command line utility though. I actually haven't used it.

There are other GUI options out there as well. My favorite is probably the [FART](http://fart-it.sourceforge.net/) utility, for obvious reasons.

## Acknowledgements

I wrote the first draft of these functions while working for [Sam Asher](https://samuelasher.com/) and [Paul Novosad](https://www.dartmouth.edu/~novosad/), who were gracious enough to encourage me to continue to develop it into a utility and make it open source. Thanks a ton.
