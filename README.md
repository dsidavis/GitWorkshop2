# Topics

+ Basics of commiting changes
  + Review of git basics See [GitBasics.md](GitBasics.md)
  + Versions, revisions and commits (???)
  + SHA
  + git commit --amend - change last commit's message, or add files, or even make change to a
    committed file.  Good to do to keep a change in a single commit rather than two or more.
+ Viewing with GitX or other GUIs
+ The three trees - commit, index/staged, working directory.
+ Undo changes
  + Resetting to previous version/commit
  + git checkout
  + git reset --hard, --soft, --mixed.
+ Collaborative distributed, decentralized editing
   + X stash
   + X conflicts
+ Branches
  + Branch concept
     + Can be on your own machine and then merge into master and then destroy
	 + or can be on the central repository and shared.
  + Merging branches (all changes)
  + Merging individual files from a branch
  + Previewing a merge result - meaning ?  What will be merged?
  + Deleting branches that have been merged.
    + git branch -d <branch name>
	+ `git push origin :branch` to delete remote branch.

  + fetch from a branch and see what changes would be merged.
  + git show-branch
  
+ tags
+ Forking

+ detached head.

+ Pulling from two repositories.
  + Can push also to both.

git reset
git reflog
git stash


git ls-files



+ Don't hesitate to create a new clone and work on that.
 + This avoids git stash
+ Make copies/backups of the repository and work on the copy to experiment
+ Explore git and SO to find out new things you can do with git.
+ Explore with 2 clones on the same machine, or on different machines.
+ Note that you don't need github/gitlab/bitbucket.  You can have repos on a local machine or 
  server and push to those using ssh logins.





+ separate a big commit into smaller more focused ones
+ combine several related commits into one.


# Concepts
refs and specs

## git commit --amend
  +  change the message for a commit.

## Remove a file from the index before commit

```
git reset HEAD <file>
```

A problem arises for the first commit.
There is no HEAD. 
```
git rm --cached file
```

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
 + https://blog.github.com/2015-06-08-how-to-undo-almost-anything-with-git/
 + How do I go back n revisions of a single file?
 
 Does git revert leave the SHA commit but undo the actual changes?
 Does git revert change multpile files if the commit is for multiple files.
 
 
 
Revert creates a new commit that reverses the edits from the commit being reverted.
This keeps a history of the original commit and also it being reversed.

git rebase doesn't do this (?)


revert can lead to a conflict and you either a) manually resolve it, 
or b) git revert --abort after `git reset HEAD` and `git checkout -- .`
 

## See which files are involved in a commit.
git ls-tree -r ref


All the commits up to rev?
```
git log --name-status rev
```



## Show the changes made in a comit.
git show ref


## Remove branches that were tracking branches on the remote(s) where those remote branches no   longer exist
 git remote prune <remote>

## How do I list the files that are changed in a commit?

git diff-tree --no-commit-id --name-only -r

git show --pretty="" --name-only bd61ad98   

See https://stackoverflow.com/questions/424071/how-to-list-all-the-files-in-a-commit
 
 

## How do I see what will be pulled when I do git pull?
```
git fetch
git log origin
git diff origin/master
```

## How do I pull all the remote branches?
git clone does this.

git fetch -all will collect more.


## How do I push a new local branch to a remote branch, i.e. a local branch that has not yet been
created on the remote?
```
git push -u origin Two
```


## Got 5 commits, go back and undo the third one and keep 4 and 5.

https://stackoverflow.com/questions/5757187/i-need-to-pop-up-and-trash-away-a-middle-commit-in-my-master-branch-how-can-i



## Combining (squashing) commits into a single commit?
See SquashCommits


Removing commits?



##
See  LateBranch

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
+ https://www.git-tower.com/blog/git-cheat-sheet

+ https://blog.github.com/2015-06-08-how-to-undo-almost-anything-with-git/
+ https://www.sbf5.com/~cduan/technical/git/
+ https://git.seveas.net/
+ https://git-scm.com/docs


+ git from the bottom up (PDF) https://jwiegley.github.io/git-from-the-bottom-up/


https://jasonrudolph.com/blog/2009/02/25/git-tip-how-to-merge-specific-files-from-another-branch/
