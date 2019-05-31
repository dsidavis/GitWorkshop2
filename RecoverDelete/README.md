
We create a file named tmp and put some contents in it.

We git add and commit it.

Then we git rm and git commit 

The file  is no longer in our working tree. 

We look at the log to see the commits.
git log 

git reset --hard HEAD~1
or
git reset --hard 56f15
to return to the first commit.



Now we remove the tmp file again and make several additional commits

Now how do we recover tmp without losing the subsequent commits?
We will go back to a commit that had the version of tmp we wanted
and then checkout that commit, but just the tmp file:
```
git checkout 56f15 -- tmp
```
