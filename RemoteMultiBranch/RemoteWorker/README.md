This repository will start with 3 branches - master, One and Two.
We will update these and see the changes in the other branches.

Note this is not a --bare repository.

git checkout -b One
echo "branch one contents " >> A
git add A
git commit -m "file A"

git checkout -b Two
echo "branch two contents " >> B
git add B
git commit -m "file B"

git checkout master

git branch -a


