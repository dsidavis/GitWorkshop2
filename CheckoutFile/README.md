mkdir CheckoutFile
cd CheckoutFile
git init


```{shell}
for i in A B C ; do
 echo $i >> txt1
 echo $i >> txt2
 git add txt1 txt2
 git commit -m "adding $i"
done
```


```
ls
README.md	README.md~	txt1		txt2
```
```
git log 
commit b633cf5279d34ca420b434167413b4294bbe887c (HEAD -> master)
Author: Duncan Temple Lang <duncan@r-project.org>
Date:   Sat Nov 24 14:41:51 2018 -0800

    adding C

commit 28ef9f70a387e659b3f70616fc0d12d3e048c368
Author: Duncan Temple Lang <duncan@r-project.org>
Date:   Sat Nov 24 14:41:51 2018 -0800

    adding B

commit ffdccef892472f58755a90f9bf7e19a1da543d2b
Author: Duncan Temple Lang <duncan@r-project.org>
Date:   Sat Nov 24 14:41:51 2018 -0800

    adding A
```

```
bash-3.2$ cat txt1
A
B
C
bash-3.2$ cat txt2
A
B
C
```

# Check out Earlier Version of txt1, but not  txt2
```
git checkout 28ef9 -- txt1
```

```
cat txt1
A
B
cat txt2
A
B
C
```


We now go back to the final commit
```
git reset --hard
```
txt1 and txt2 are the same and contain A, B, C on separate lines.

Now we checkout both txt1 and txt2 files corresponding to the initial commit ffdcce
```
git checkout ffdcee -- txt1 txt2
```

```
cat txt1
A
cat txt2
A
```


Since there are only two files, we may just want to go back to this first commit
for the entire branch.

Let's start back at the point we had three commits:
```
git reset --hard
```

Now let's wind back to the first commit:
```
git reset ffdcce
```

```
git show-branch
```

```
git log
commit ffdccef892472f58755a90f9bf7e19a1da543d2b (HEAD -> master)
Author: Duncan Temple Lang <duncan@r-project.org>
Date:   Sat Nov 24 14:41:51 2018 -0800

    adding A
```

We can continue from here.

Git has forgotten about the previous HEAD.
If we `git reset --hard`, we don't go  back to the commit of the C line.
Interestingly, if we know the SHA1 for that commit, we can get back to it.
```
git reset --hard b633cf5
```
If we didn't know that SHA1, we could use `git reflog` to try to find it 
in the history of all SHA's. Note that they will be garbage collected
after 2 or 3 months (depending on various configuration variables controlling garbage collection).


## git revert

To wind back the commits of C and B, we can also use git revert.
```
git revert b633
git revert 28ef9
```
Note the order of the reverts: we revert the last commit, and then the commit before that.

After the first git revert:
```
cat txt1
A
B
bash-3.2$ cat txt2
A
B
```
```
git log
commit 6cb6070706de4abc8c8d28957a1fef9d8922e352 (HEAD -> master)
Author: Duncan Temple Lang <duncan@r-project.org>
Date:   Sat Nov 24 15:10:21 2018 -0800

    Revert "adding C"
    
    This reverts commit b633cf5279d34ca420b434167413b4294bbe887c.

commit b633cf5279d34ca420b434167413b4294bbe887c
Author: Duncan Temple Lang <duncan@r-project.org>
Date:   Sat Nov 24 14:41:51 2018 -0800

    adding C

commit 28ef9f70a387e659b3f70616fc0d12d3e048c368
Author: Duncan Temple Lang <duncan@r-project.org>
Date:   Sat Nov 24 14:41:51 2018 -0800

    adding B

commit ffdccef892472f58755a90f9bf7e19a1da543d2b
Author: Duncan Temple Lang <duncan@r-project.org>
Date:   Sat Nov 24 14:41:51 2018 -0800

    adding A
```
Note the extra commit at the top of the output. This is the commit
corresponding to the revert step.

After the second git revert:
```
cat txt1
A
bash-3.2$ cat txt2
A
```

## Checkout as a Branch - WRONG!
```
bash-3.2$ git checkout 28ef9
Note: checking out '28ef9'.

You are in 'detached HEAD' state. You can look around, make experimental
changes and commit them, and you can discard any commits you make in this
state without impacting any branches by performing another checkout.

If you want to create a new branch to retain commits you create, you may
do so (now or later) by using -b with the checkout command again. Example:

  git checkout -b <new-branch-name>

HEAD is now at 28ef9f7 adding B
bash-3.2$ cat txt1
A
B
bash-3.2$ cat txt2
A
B
bash-3.2$ git reset --hard
HEAD is now at 28ef9f7 adding B
bash-3.2$ cat txt1
A
B
bash-3.2$ git branch -a
* (HEAD detached at 28ef9f7)
  master
bash-3.2$ git checkout master
Previous HEAD position was 28ef9f7 adding B
Switched to branch 'master'
bash-3.2$ cat txt1
A
B
C
bash-3.2$ cat txt2
A
B
C
bash-3.2$ git branch -a
* master
```
