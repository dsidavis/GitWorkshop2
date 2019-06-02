
We simulate working on the master when we should have created a branch.
So we retroactively move our commits to a branch.

We start with a file txt and we make 3 commits, adding the
simple lines A, B, and C.

We'll do this programmatically.
```{shell}
for i in A B C ; do
echo $i >> txt
git add txt
git commit -m "adding $i"
done
```

```
git log
```

Now we plunge ahead and add M N O P and Q:
```
for i in M N O P Q; do 
  echo $i ; echo $i >> txt; git add txt; git commit -m "adding $i" ; 
done
```

Now we realize that we didn't want M N O P Q on this master branch.
Instead, we wanted it on a separate branch named, say, later.



```
git checkout -b later
```
We can check we created the branch and we are currently on that branch:
```
git branch -a
```
We can check the commits via `git log`
We can see from the first line 
```
commit 1cf632a89d2f0dd41db83bb8f218addd48823ed0 (HEAD -> later, master)
```
that the two branches later and master have the same HEAD, i.e. point
to the same commit.

So let's switch back to the master and have it point to the third commit,
i.e. of the line C.
```
git checkout master
git log
```

The log tells us that the commit for C has a hash that starts with 
d41ed418. So we use git reset to point HEAD to this:
```
git reset --hard d41ed418
```
The --hard cleans up all of the staging and working directories as well, 
so we are fully back where we should have been.


When implementing this example, I took notes in this README.md file.
I only added it at the end, after creating the later branch and reset'ing
master.  So when I committed it, later and master diverged or their paths forked
(not forked in the git fork sense).
We can see this within GitX or another GUI or via 
```
git log --all --graph --decorate
```
We see the two branches or paths, and the master one is most recent.

How do we get README.md onto later?

```
git checkout later
git merge master
```
Then provide a message for this merge commit.






