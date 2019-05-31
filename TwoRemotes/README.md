We have two repositories A and B

Now we clone A into a new repository named C:
```
git clone A C
```
So now C is a clone of A


We now want to connect C to B:
```
cd C
git remote add B ../B
git remote -v
```

Note that currently C/ only contains the file a.R pulled from A/
```
ls
```

But now we will pull from B
```
git pull B master  --allow-unrelated-histories
```
Without the --allow-unrelated-histories, git will elect not to do the merge.



Edit the code in A/a.R and commit.


In C
```
git pull origin master
```
We get the update to a.R locally in C/


Edit B/b.R and commit
```
git commit -m "second commit for b.R"
```

In C, 
```
git pull B master
```
and we get the update in b.R.
