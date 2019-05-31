# Git Workshop

[https://github.com/dsidavis/GitWorkshop2](https://github.com/dsidavis/GitWorkshop2)

This is currently scheduled as a 2-part workshop, today and next Friday.

Day 1 is for hands on working with git and gaining experience and familiarity with
the typical day-to-day things we do with git, including
+ branches
+ remote repositories

and including some less common aspects 
+ of querying git for information to help
us in our day to day work, and 
+ fixing problems that occur

Day 2 will probably go further into some of the more intermediate and advanced aspects of git
that are useful.
But before we plan for day 2, I'd like to understand what you already know and how far we should
aspire to go in the 2 days and what topics you would like us to cover together.


# [Questions](Questions.md)

Add questions to the following google doc:
[https://tinyurl.com/y3d37825](https://tinyurl.com/y3d37825)
[https://docs.google.com/document/d/1vYwPVTQ_BytoBAkthZxJ6Qf2zjMW1HgqrK5-eT39yNw/edit?usp=sharing](https://docs.google.com/document/d/1vYwPVTQ_BytoBAkthZxJ6Qf2zjMW1HgqrK5-eT39yNw/edit?usp=sharing)

# Day 1
## Goals
  + Get very comfortable with the practical details of using git collaboratively.
  + Work in groups of 2 or 3 (which?)
  
## Hands-on Activities
  + one of you (with the help/oversight of others) create a local repository
    + <!-- git init -->
  + Create a new repository on github/gitlab/bitbucket
  + Add all group members as a collaborator  
  + push that to the git <!-- git remote add ... ; git push -u origin master -->
  + the rest of the members (and the initial creator) clone the repos.
     <!-- git clone  -->
  + One person creates a README.md
    + Describe the project by listing the group members
	+ Each person adds their own name.
	+ See what changes you have
	  + git status
	  + git diff 
	+ git pull; git add; git commit; git push
  + Each member creates and edits a separate file
    + one to do the simulation
	+ one to plot the results. 
	   + Successively add annotations to the plot to make it more interesting and informative.
    + Make several successive edits and push
	+ Will need to git pull before each git push
  + Now edit each others files. 
    + Add a comment describing the function, or one or more of the parameters.
	+ Again, successive small edits and commits and push.
 
  + Each of you create a branch
    + Develop a new file/function on that branch
	+ Continue to commit small changes
	+ Push the branch <!-- git pull/push -u origin branch ; git checkout -->
	+ Add to an existing file on that branch, e.g. a README.md or TODO.md or ChangeLog file.
	+ When finished, somebody else in the group merge the branch. <!-- git merge -->


  + Make a change (e.g. add a comment) that is wrong and commit it.
  + Correct the comment.
     + <!-- git commit --amend -->
  + Undo a commit
     + <!-- git revert or git reset HEAD~ -->
  + Rename one of the files
  + Add a file, edit it and commit it.
     + Then remove it. <!-- git rm -->



## [Git Concepts](GitConcepts.md)

## [Workflow Guidelines](WorkflowGuidelines.md)


## Day 2  - Possible Topics
### What are git topics you want to know more about next week 
I have numerous topics I explored and will share. But it would be
great to have emails/posts in which you identify aspects of VCS/git that you 
have questions about.

+ Cherry picking example.
+ Remove all mentions of a particular file, e.g. passwords, large file or some indelicate remark/comment.
   + git filter-branch --tree-filter 'rm -f password.txt'
+ Split off a subpart of an existing repository into its own repository
  + Keeping all the commit history and branches for that subpart
+ Organizing commits - rewriting history.
   <!-- git rebase -i -->
+ 

## Scenario
 + Make a commit (or several) on the master and then realize you should be on a branch.
  + If you haven't made the commit, then switch to a new branch and stage/commit.
  + But 2 approaches if you have made commits in the wrong branch.
  + See [LateBranch](LateBranch)
  + A second way is to find the SHA for the commits we want on the new branch,
    reset hard on master, create the branch and then add the commits.


  
  
  
  
  
# pull requests to projects.
