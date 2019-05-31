git init
git clone


git status
git diff file1

git add file1 file2 dirA
git commit -m "a message"

Unstage: git rm --cache filenames


git pull
git push

git fetch

git rm file
git mv 


git commit --amend
  + add additional files you omitted, or change the message.


git revert

git reset

git log -g  reflog.

### Diagnostics
git log
git blame

## Branches


git checkout -b new-branch-name
  + leaves index and working tree unchanged.
git checkout previous-branch-name


git merge new-branch-name


git branch -d 
git branch -dr






## Intermediate

git config --list

I discovered aliases that were defined for me via this, e.g git scf


git rebase -i sha
git cherry-pick





git clean 
  -n dry run
  -f force
  -d directories
  -x ignored files
