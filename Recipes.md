
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


# How do I determine which files will be pushed

```
git diff --stat --cached origin/master
```

