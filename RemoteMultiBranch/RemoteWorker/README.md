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




## Adding a Second Branch
Jane had pushed branch One before we had initially cloned the centralized BareRepos.
Accordingly, the clone automatically included the remote branch. We
were able to create a local tracking copy of the branch in our local repository.
```
git checkout -b One --track origin/One
```

But now let's 


Now, after we have created our MyRepos,
suppose Jane, working in her RemoteWorker directory, creates a new branch
```{shell}
git checkout -b Two
echo "branch two contents " >> B
git add B
git commit -m "file B"
```
She then pushes this to the remote repository
```
git push -u origin Two
```

Jane tells us about this new branch or we find out about it.
So, in MyRepos, we 
```
git fetch --all
```
```
Fetching origin
remote: Counting objects: 8, done.        
remote: Compressing objects: 100% (6/6), done.        
remote: Total 8 (delta 0), reused 0 (delta 0)        
Unpacking objects: 100% (8/8), done.
From /Users/duncan/GitEg/RemoteMultiBranch/BareRepos
 * [new branch]      Two        -> origin/Two
```
So we see the new branch.

We could merge just that branch with
```
git pull origin Two
```
```
git branch -a
```
```
  One
* master
  remotes/origin/HEAD -> origin/master
  remotes/origin/One
  remotes/origin/Two
  remotes/origin/master
```

Let's create a tracking branch for this origin/Two branch
```
git checkout -b Two --track origin/Two
git branch -a
```
```
  One
* Two
  master
  remotes/origin/HEAD -> origin/master
  remotes/origin/One
  remotes/origin/Two
  remotes/origin/master
```

We'll update the file B, add a new file (B_local), commit the changes  and push them.
```
echo "B local content" >> B
echo "MyRepos B local" > B_local
git add B_local B
git commit -m "local version of B"
git push
```

Now let's return to Jane's computer and working directory.
She is on branch Two which tracks origin/Two. We can see this with
```
git branch -vv
```
```
  One    9f0f9e2 [origin/One] file A
* Two    50c083d [origin/Two] file B
  master 623031e [origin/master: ahead 2] Merge branch 'master' of /Users/duncan/GitEg/RemoteMultiBranch/BareRepos
```
or 
`git remote show origin`.
Now, we can integrate the changes made from MyRepos's into origin/Two with
```
git fetch --all
git merge origin/Two
```
We could also have done `git pull` or `git pull --all`.
What's the difference? <!-- question -->



