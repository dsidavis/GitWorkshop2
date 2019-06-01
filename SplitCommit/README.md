This is about how to split one commit into multiple smaller commits.

```
echo "Start" > file1
git add file1
git commit -m "initial commit"
```


Let's add 6 lines
```
for v in A B C D E F ; do
  echo $v >> file1
done
```

Then we commit this.
```
git add file1
git commit -m "initial file with 6 lines as one commit"
```

Now we want to split this into 3 separate commits
+ one with A C E
+ one with B 
+ one with D and F
We'll leave white space 


```
git rebase -i HEAD~
```
This brings up our editor and we change the line
```
pick 13571ce initial file with 6 lines as one commit
```
to
```
edit 13571ce initial file with 6 lines as one commit
```
and exit the editor session.


We first undo the commit we want to split.
We use git reset to unstage that commit.
```
git reset HEAD^
```
As always, `git status` tells us what state we are in
```
git status
```
and that file1 is modified.


Now we use interactive git add to select a subset of the changes
to stage.  See the AddPartial example.
```
git add -p file1 
```
This shows the changes (marked with +) and gives us a choice of actions
```
Stage this hunk [y,n,q,a,d,e,?]? 
```
We choose `e` for edit.
This presents the file in our editor and with many additional comment
lines (starting with #) that explain what to do.
We add comment characters at the start of  those lines we do NOT want included in this commit.
Since we want to commit A C and E lines, we comment out the other lines that start with a +.
(This means we can ignore the first line that contains Start since this is from a different earlier
commit.)

When we finish editing the chunk to select the lines we want in this separate commit,
git will automatically stage that change for us.
We can verify this with a call to `git status` and for completeness, `git show :file1`.

```
git commit -m "committing A C and E lines"
```


We then want to commit the B line as the next subcommit.
```
git add -p file1
```
Again, we comment out the other lines starting with +, leaving only the `+B` line.
Again, git will stage this - we check with `git status` and `git diff`.
And then we commit
```
git commit -m "committing B"
```

And finally we can commit the entire file as the only 2 lines that haven't been committed
by now are the D and F lines.
Again, check this with `git diff`.
So 
```
git add file1
git commit -m "committing D and F lines"
```

The final step is  to complete the rebase operation
```
git rebase --continue
```

Finally, we can look at the log to verify what we achieved
```
git log
```
And we see 4 commits rather than our original 2.

