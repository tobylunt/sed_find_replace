# Find and replace utility

Have you ever had to modify a large codebase when you realized you had a poorly named dataset or variable mucking up your life? Have you dreaded breaking things you haven't touched in months by ripping through your code with `sed`?

Even under version control, large-scale find and replace can be a pain in the butt and a little nerve-wracking. This little utility helps the process by highlighting each individual *complete* line change, so you can visually confirm that your replacement code doesn't have unintended consequences.

The backbone of the utility is the extraordinarily powerful `GNU sed`. Thanks. This just makes it a little easier and a little less terrifying to use. Keeping your stuff under version control is strongly recommended before using this utility

