This is an illustration of rebase rather than merge.
See https://hackernoon.com/git-merge-vs-rebase-whats-the-diff-76413c117333


We start with the master branch and have two commits to a file, say file1.
Then we create branch, say devel, and add two commits to it.
Then we switch back to master and add a commit.
Then we switch to devel and rebase it with respect to master to include
the new commit on master.


git init


echo A > file1
git add file1
git commit -m "initial commit on master"

echo B >> file1
git add file1
git commit -m "second commit on master"

git checkout -b devel


echo X >> file1
git add file1
git commit -m "first commit on devel"

echo Y >> file1
git add file1
git commit -m "second commit on devel"

git checkout master

echo C > file2
git add file2
git commit -m "third commit on master"


git checkout devel

git log

git rebase master

git log --graph --oneline

```
* b46be73 (HEAD -> devel) second commit on devel
* 2ae2ef3 first commit on devel
* 3a60c54 (master) third commit on master
* 48cce2f second commit on master
* 15b1548 initial commit on master
```

If instead of `git rebase`, we did 
```
git merge master
```
we would get a merge commit and git would open our editor for a message.


The resulting files (file1 and file2) have the same content.
However, the git dependency graph would be different
```
git log --graph --oneline
```
```
*   967dda4 (HEAD -> devel) Merge branch 'master' into devel
|\  
| * 642ce11 (master) third commit on master
* | 8166691 second commit on devel
* | 5bd885c first commit on devel
|/  
* 22e02bc second commit on master
* 699943a initial commit on master
```



# Conflicts

When you rebase, you may get a conflict if the change on the master branch (in this case)
collides with changes on the devel branch.
Resolve the conflict and commit the updated files.
