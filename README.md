# Topics

+ Basics of commiting changes
  + Versions
  + SHA
+ Viewing with GitX or other GUIs  
+ Resetting to previous version/commit
+ Collaborative distributed, decentralized editing
   + stash
+ Branches
  + Merging branches
  + Merging individual files
  + Previewing a merge result - meaning ?  What will be merged?
  + Deleting branches that have been merged.
    + git branch -d <branch name>

+ Forking

+ detached head.

# Concepts
refs and specs




## git commit --amend
  +  change the message for a commit.


## What will get pushed
```
git diff --stat --cached origin/master
```

## abort a merge/update
```
git merge --abort
```

How do I revert a single file?
 + `git checkout -- file1 
 + How do I go back n revisions of a single file?
 
 Does git revert leave the SHA commit but undo the actual changes?
 Does git revert change multpile files if the commit is for multiple files.
 
 
 
 
 

How do I see what will be pulled when I do git pull?

How do I pull all the remote branches?

How do I push a new local branch to a remote branch, i.e. a local branch that has not yet been
created on the remote?


## Got 5 commits, go back and undo the third one and keep 4 and 5.

Combining (squashing) commits into a single commit?

Removing commits?



##
Say we have a HEAD at position K, then we continue with a sequence of commits up L ... Q
Now suppose we realize we needed L ... Q on its own branch.
How do we get them there.

+ Create a new branch at the current point Q
  + This has A ... K L ... Q
+ On the original branch (perhaps master), rewind to K.


##


What is going on here
```
git revert f70fb
# detached HEAD
git reset --hard
```
The other 2 commits are in the tree/path.


#
+ https://www.sbf5.com/~cduan/technical/git/
+ https://git.seveas.net/
+ https://git-scm.com/docs




https://jasonrudolph.com/blog/2009/02/25/git-tip-how-to-merge-specific-files-from-another-branch/
