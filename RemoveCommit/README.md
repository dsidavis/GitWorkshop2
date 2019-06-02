We create 5 commits.

```{shell}
for i in A B C D E ; do
 echo $i >> txt
 git add txt
 git commit -m "adding $i"
done
```

Now, we want to remove the commit that added C, but leave D and E.
(Of course, we can delete C and commit again. But that is not the point of 
this example.)

```
cat txt
```

```
git log
```


```
git revert c1526
```
