We create a repository and start development on master.
Then we switch to a branch and add 3 commits there.


git init



We start by creating the simple function
```
foo =
function(x)
{
   x + 2
}
```
in the master branch.

Then we create a new branch 
```
git checkout -b devel
```

We edit foo.R to add the offset parameter with a default value:
```
foo =
function(x, offset = 2)
{
   x + offset
}
```

```
git commit -m "added offset as parameter with default"
```

Next we add a new function foobar
```
foobar =
function(x)
{
     log(foo(x))
}
```
and commit that
```
git commit -m "introduced foobar"
```


Now we recognize that the default value for offset should be 20.
So we edit foo.R
```
foo =
function(x, offset = 20)
{
   x + offset
}
```
And we commit this
```
git commit -m "changed default value of offset"
```


So now we want to port the changes to the function foo to the master branch.
However, we don't want the foobar function.  This means we cannot just merge the devel
branch into master. Instead, we need to merge the first and third commits.

```
git checkout master
Switched to branch master
```


```
cat foo.R

foo =
function(x)
{
   x + 2
}
```

```
git cherry-pick 434e68c
[master 396e792] added offset as parameter with default
 Date: Sun Apr 14 12:37:07 2019 -0700
 1 file changed, 2 insertions(+), 2 deletions(-)
```

So foo.R now looks like
```
cat foo.R

foo =
function(x, offset = 2)
{
   x + offset
}
```

We bring in the 3 commit on dev to the master
```
git cherry-pick e75f1a6b9
[master 224827d] changed default value of offset
 Date: Sun Apr 14 12:38:51 2019 -0700
 1 file changed, 1 insertion(+), 1 deletion(-)
```

And now foo.R is
```
cat foo.R

foo =
function(x, offset = 20)
{
   x + offset
}
```

Let's look at the log for master
```
git log
commit 224827db5b7b8409edfea9b8624cc578bc63d1c7 (HEAD -> master)
Author: Duncan Temple Lang <duncan@r-project.org>
Date:   Sun Apr 14 12:38:51 2019 -0700

    changed default value of offset

commit 396e7927e6ecce101bd1df946172aa78563d8a87
Author: Duncan Temple Lang <duncan@r-project.org>
Date:   Sun Apr 14 12:37:07 2019 -0700

    added offset as parameter with default

commit be0b1e9da2e76451cbe0a48c1cdb85068219db80
Author: Duncan Temple Lang <duncan@r-project.org>
Date:   Sun Apr 14 12:36:24 2019 -0700

    initial function
```

```
git show-branch
! [devel] changed default value of offset
 * [master] changed default value of offset
--
 * [master] changed default value of offset
 * [master^] added offset as parameter with default
+  [devel] changed default value of offset
+  [devel^] introduced foobar
+  [devel~2] added offset as parameter with default
+* [master~2] initial function
```


## Bonus.
What if we now want to bring the foobar function into master.
We can use cherry-pick.
However, we can also try a merge.

We check we are on the master branch and get the name of the devel branch.
```
git branch
  devel
* master
```

Next we merge
```
git merge devel
Auto-merging foo.R
hint: Waiting for your editor to close the file...
Merge made by the 'recursive' strategy.
 foo.R | 5 +++++
 1 file changed, 5 insertions(+)
```
```
cat foo.R

foo =
function(x, offset = 20)
{
   x + offset
}

foobar =
function(x)
{
     log(foo(x))
}

```

Things look correct.
However, let's look at the entire commit log

```
git log
commit c1888744175eb8ff0224d7754a5e521d8cfa0772 (HEAD -> master)
Merge: 224827d e75f1a6
Author: Duncan Temple Lang <duncan@r-project.org>
Date:   Sun Apr 14 12:52:57 2019 -0700

    Merge branch 'devel'

commit 224827db5b7b8409edfea9b8624cc578bc63d1c7
Author: Duncan Temple Lang <duncan@r-project.org>
Date:   Sun Apr 14 12:38:51 2019 -0700

    changed default value of offset

commit 396e7927e6ecce101bd1df946172aa78563d8a87
Author: Duncan Temple Lang <duncan@r-project.org>
Date:   Sun Apr 14 12:37:07 2019 -0700

    added offset as parameter with default

commit e75f1a6b9cb4da8ed1ec944b5495f4b88e4dd641
Author: Duncan Temple Lang <duncan@r-project.org>
Date:   Sun Apr 14 12:38:51 2019 -0700

    changed default value of offset

commit 544d833e8c54a40f518a5a43d02511dd7769d8cf
Author: Duncan Temple Lang <duncan@r-project.org>
Date:   Sun Apr 14 12:38:32 2019 -0700

    introduced foobar

commit 434e68ca35a76e2cb3c35d02aa71685c58c67c8e
Author: Duncan Temple Lang <duncan@r-project.org>
Date:   Sun Apr 14 12:37:07 2019 -0700

    added offset as parameter with default

commit be0b1e9da2e76451cbe0a48c1cdb85068219db80
Author: Duncan Temple Lang <duncan@r-project.org>
Date:   Sun Apr 14 12:36:24 2019 -0700

    initial function
```
We have duplicated the commits we cherry-picked.


```
git show-branch
! [devel] changed default value of offset
 * [master] Merge branch 'devel'
--
 - [master] Merge branch 'devel'
+* [devel] changed default value of offset
```


## Bonus 2

Let's merge the two commits 224827 and 396e792 into a single commit.


```
git checkout devel
git rebase -i master~3
```

In the editor, we change the order of the commits
to move the 3rd to second and then squash it



If we did this on the master branch, we end up with conflicts.
To explore this, let's create a new branch from master
```
git checkout master
git checkout -b fix
```

We'll rebase the entire sequence of edits to remove the duplicates
we introduced during the cherry-picks and the merge

git rebase -i be0b1e9
