
We first create


```
git init
git status
git add R man
git commit -m "initial version with R and help file"
```

Next we change bigfiles.R to add a default value for the dir parameter.
Then we commit this change:
```
git add R/bigfiles.R
git commit -m "add a default value for the directory"
```

Then we separately commit a change to the .Rd file that also adds the default
value for dir:
```
git add man/bigfiles.Rd
git commit -m "separately updated the documentation for bigfiles to show the default value for dir"
```


We can see the three commits with
```
git log
```


We could combine the last two commits into one.
```
git rebase --interactive HEAD~2
```
This pulls up your editor and we see
```
pick bad710be2426288d4a1030c215acecd9e41704a  
pick bc5bacca027edda3065b74f3a22ea03a19e23f75
```
Change the `pick` in the  second line to  squash, i.e.,
```
squash bc5bacca027edda3065b74f3a22ea03a19e23f75
```
(or fixup rather than squash) and save and exit the editor.
This will then bring up another text editor session for you to 
edit the commit message. (With fixup, you won't get this second
opportunity to specify the commit message and git will use the most recent
message from the commits being combined.)

Now let's look at the output of `git log`:
```
commit 6cc81608650059c6e7ba3d7d720845fbfb125418 (HEAD -> master)
Author: Duncan Temple Lang <duncan@r-project.org>
Date:   Fri Nov 23 07:18:56 2018 -0800

    add a default value for the directory
    
    separately updated the documentation for bigfiles to show the default value for dir

commit 20226f59bc8e5d7c184d233c58c4edd1a1567d4d
Author: Duncan Temple Lang <duncan@r-project.org>
Date:   Fri Nov 23 07:18:15 2018 -0800

    initial version with R and help file
```
If we look at the differences in the files between our new HEAD and the previous
HEAD with
```
git diff HEAD HEAD^
```
we see
```
diff --git a/R/bigfiles.R b/R/bigfiles.R
index 41d78f5..0092d72 100644
--- a/R/bigfiles.R
+++ b/R/bigfiles.R
@@ -1,5 +1,5 @@
 bigfiles =
-function(dir = "~/Downloads") 
+function(dir) 
 {
     i = file.info(list.files(dir))
     i[order(i$size, decreasing = TRUE), c("size", "ctime"), drop = FALSE]
diff --git a/man/bigfiles.Rd b/man/bigfiles.Rd
index 1c429ee..26740ae 100644
--- a/man/bigfiles.Rd
+++ b/man/bigfiles.Rd
@@ -5,7 +5,7 @@
 
 }
 \usage{
-bigfiles(dir = "~/Downloads")
+bigfiles(dir)
 }
 \arguments{
   \item{dir}{the path to the directory interest}
```
You can also see this easily in a GUI such as GitX.



Next we are going to change the function to do the same thing
by default, but give the caller more control over which files to 
explore and possibly reuse computations.
The point here is that we will make changes to both the .R and the .Rd files
add each before we commit them both in a single commit.

```
git status
git add R/bigfiles.R man/bigfiles.Rd
git commit -m "changed the parameters"
git log
```
