# 
Since the last commit, I've changed several files.
But I want to discard all of these changes and go back to that commit.

```
git reset --hard
```

# Find all the commits that changed a range of lines in a file

In the Rtesseract source, 
```
git log -L306:310:src/ext.cpp
```

# How do I determine which files were involved in a commit?
```
git show --pretty="" --name-only c9a372
```


# How do I determine which files will be pushed

```
git diff --stat --cached origin/master
```

# How do I find the commits that affected a given file, e.g. the file named tmp
```
git rev-list HEAD -- tmp
```


# How do bring a subset of changes from one branch onto another branch?
Use git cherry-pick. This is for commits, while git merge is for merging all commits from an entire branch.
See [CherryPick](CherryPick).


# How do list all the files under version control in the repository
```
git ls-tree --full-tree -r --name-only HEAD
```

git ls-files



# How do I see the contents of a file in the index/stage/cache
```
git show :filename
```


# Tell git never to modify/merge a specific file in your repository
```
git update-index --assume-unchanged <pathToLocalFile>
```
