This shows how to bring over one or more *entire files* from one branch
to another branch.
This is different from cherry-pick as that is for commits, not files.


We start with a two commit master.
We create a branch devel.

We then update devel to add a new function foobar().

The we switch back to master and change the function foo() to make what we add a parameter.

Then we switch back to the devel master.  We could merge master into devel.
However, we will rebase.


See Session




## README.md

We switched to the devel branch before we created the README.md.
So it is now on the master branch.
This was a "mistake".
So how do we get this back onto the master branch.
We use `git checkout`

```
git checkout  devel README.md
```

```
git rebase master devel
```

See https://jasonrudolph.com/blog/2009/02/25/git-tip-how-to-merge-specific-files-from-another-branch/

