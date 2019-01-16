# Find and replace utility

Have you ever had to modify a large codebase when you realized you had a poorly named dataset or variable mucking up your life? Have you dreaded breaking things you haven't touched in months by ripping through your code with `sed`?

Even under version control, large-scale find and replace can be a pain in the butt and a little nerve-wracking. This little utility helps the process by highlighting each individual *complete* line change, so you can visually confirm that your replacement code doesn't have unintended consequences.

The backbone of the utility is the extraordinarily powerful `GNU sed`. Thanks. This just makes it a little easier and a little less terrifying to use.

Keeping your code under version control is strongly recommended before using this utility.

## How to use

This is under development and is currently not executable. Ultimately you will download the sed_find_replace.sh and add it to your path, then use the `sed_find_replace "old_string" "new string"` format.

Options will include:

*`-a`: Accept all changes (output for each line's replacement will still be printed). Default is to prompt the user to accept or reject each change.
*`-r`: Desired depth of recursion into subfolders. E.g. `-r 1` will search pwd and one level of subfolders. `-r` give full recursion. Default is no recursion.

