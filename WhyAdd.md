# Why do you need to explicitly `git add` and the `git commit` ?

This does seem, on first appearances, goofy.  You make
a change to a file, say README.md. Then you 
```
git add README.md
git commit -m "some message about the changes"
```

In other version control systems, you can just
do the equivalent of 
```
git commit -m "some message"
```
and you don't need the `git add`.



To answer this ....
Firstly, you can use the -a flag with `git commit`, e.g.
```
git commit -a -m "the message"
```
and this will commit all files that were changed and were are already added (explicitly
or implicitly) at some point.


There are several reasons we use and need `git add`
+ to explicitly add new files to be under git and not ignored
+ to commit changes to one or more files, but ignore changes to other files
   that are being tracked (were `git add`ed) but are not ready to be committed.
+ to be able to prepare a single commit in multiple operations.
   
git add allows us to combine changes to a subset of files into a single commit.
This fine-grained commit give us the ability to make coherent, specific changes
across multiple files that constitute as single conceptual change.
This single commit can be easily undone/reverted or applied elsewhere
and reused. It makes seemingly disparate changes connected.

We can even use  `git add -p filename` to add individual lines of a current file,
not just all of the current changes for that file. Again, this permits high-resolution changes.


Note that one


Since we have a staged area, it is useful to be able to query what it contains -
both the names of the files, and their contents.
```
git diff --name-only --cached
git diff --cached txt 
git diff --staged txt 
```
<!-- https://stackoverflow.com/questions/33610682/git-list-of-staged-files -->


