## Workflow Philosophy
+ Commit locally early and often 
+ Use branches for each new feature/concept 
  + Keep separate from master so can easily pull on master from remote repository
  + merge branch into master when complete
  + delete branch when finished
  + remote branches for working collaboratively on a feature/branch.
+ Don't push to remote if you think you will ever change the commits
+ Change the commits to tidy up concepts
  + Most of the time, we don't care. Just git push often for others to pickup.
  + But reasons to change commits.
    + Change commit messages to be more informative.
    + Split big commits into separate, more focused commits to make easy to undo each one.
    + Combine numerous related commits into one so easily reverted/undone
    + Change the order of the commits.



## From 
`git help workflows`

```
try to split your work into small steps from the very beginning. It is always easier to squash a few commits together than to    split one big commit into several
```
```
They should be consistent, working
       independently of any later commits, pass the test suite, etc. This makes the
       review process much easier, and the history much more useful for later
       inspection and analysis
```


```
merging works at the branch level, while cherry-picking  works at the commit level.
... scales much better to a large number of contributors
... merges require a more careful branch   management.
```
