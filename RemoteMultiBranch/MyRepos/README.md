This repository will start with 3 branches - master, One and Two.
We will update these and see the changes in the other branches.

Note this is not a --bare repository.
But we cloned it from a bare repository.

```
mkdir BareRepos
cd BareRepos
git init --bare
```

From the top-level directory above BareRepos,
we'll clone BareRepos to a local directory named
RemoteWorker. This will act as the working repository
for our collaborator who will start the project.
```
git clone BareRepos RemoteWorker
git branch -a
```

Our project creator is working away
and creates a commit in the master branch:
```
git add README.md 
git commit -m "README as first commit on remote worker's version of the centralized repository"
```
She pushes this change to the centralized bare repository with
```
git push -u origin master
```
The -u will mean future `git push` commands will remember the origin master
and we won't have to specify them, for this branch.


After a while, she creates a branched named One in her local repository
```{shell}
git checkout -b One
echo "branch one contents " >> A
git add A
git commit -m "file A"
```

Our project creator may continue working on this branch or doing other things.
Eventually, she decides to share this with others via the central repository.
She may just decide to do this so that she can easily share it with herself
on another machine via the centralized respository. (She could do this differently
without using the central repository, but that's not very important, just something
to know is possible.)
So she git push'es but this time to the One branch on the origin
```{shell}
git push -u origin master
```

# Working on Our Own Version of the Repository

For now, we'll focus on our development.
We join the project, so we clone the central repository
```
git clone BareRepos MyRepos
cd MyRepos
```

We start by looking around
```
ls
git branch -a
```
```
* master
  remotes/origin/HEAD -> origin/master
  remotes/origin/One
  remotes/origin/master
```
So we see we are on the master branch, but that we also have the
branch origin/One.
This refers to the branch on the origin. We'll have to explicitly track it later
if we want to work on it.


We create and edit the file named README_local.md.
We add and commit it.
We are now ready to share this file/commit by pushing it to the central repository.
```
git push -u origin master
```


Let's consider what Jane sees in her repository.
Initially, she sees nothing as she has not consulted
the central repsository to see if there are any changes.
However, she can do so with
```
git fetch
```
```
remote: Counting objects: 3, done.        
remote: Compressing objects: 100% (3/3), done.        
remote: Total 3 (delta 0), reused 0 (delta 0)        
Unpacking objects: 100% (3/3), done.
From /Users/duncan/GitEg/RemoteMultiBranch/BareRepos
   7c82128..a17b945  master     -> origin/master
```
git fetch doesn't make any changes.
We can see if there are any changes
```
git diff origin/One
```

She is on the branch named One 
so there are no changes in the remote repository for this branch.
The only changes she will see in the diff arise if she has made changes locally
and  the git diff shows these changes.





```{shell}
git checkout -b Two
echo "branch two contents " >> B
git add B
git commit -m "file B"
```

```
git checkout master
```
```
git branch -a
```

