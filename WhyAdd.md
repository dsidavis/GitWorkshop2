# Why do you need to explicitly `git add` and the `git commit` ?

This does seem, on first appearances, goofy.  You make
a change to a file, say README.md. Then you 
```
git add README.md
git commit -m "some message about the changes"
```

In other version control systems, you can just
do 
```
git commit -m "some message"
```
and you don't need the `git add`.

Firstly, you can use the -a flag with `git commit`, e.g.
```
git commit -a -m "the message"
```
and this will commit all files that were changed and were are already added (explicitly
or implicitly) at some point.


There are several reasons we need `git add`
+ to explicitly add new files to be under git and not ignored
+ to commit changes to one or more files, but ignore changes to other files
   that are being tracked (were `git add`ed) but are not ready to be committed.

