We start with a README.md.

git add README.md
git commit -m "first commit"
git log

Then we add this sentence.

git add README.md
git commit --amend -m "updated README.md with extra sentence but change the original commit"

# edit the message


git log


Note that we can find the initial commit via the reflog:
git log -g
