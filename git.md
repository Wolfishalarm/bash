## This is my git readme file with tips and the basics.

### Tips
 - Don't make too many commits, makes you look unprofessional. Get all right, then commit.
 - Make your commit message short, look for examples in the git log (brief summary).

### Clone a repo
```console
   $ git clone https://github.com/Wolfishalarm/bash.git
```

### Get the location of the repo (click link to get to URL in browser)
```console
  $ git remote -v
```

## Logs
### Look at the git log for a repo.
If you want to see changes along with the commits, (show everything):
```console
  $ git log -p
```

## Get a list of all the commits, in short format
```console
  $ git log --pretty=oneline
```

## Making changes to a repo
If you make changes to a file in the repo and are happy with it.
All these commands are against my *local* copy.
### Flow for checking in chages.
```console
  $ git status
  $ git add file1.txt
  $ git add file2.txt
  $ git commit -m "Commit message here."
  $ git push
```

### Making commits (never use '-am', this is sloppy).
```console
  $ git -am "THIS IS BAD."
```

### Back out the last commit or two.. (*DELETE* preious commits)
```console
  $ git log --pretty=oneline
  $ git revert <commit hash>
  $ git commit -m "Reverting last commits cause I messed up."
  $ git push
```

### When it's perfect, you can push it up to the remote branch
```console
  $ git push
```

### Recurrisively search the repo for a string
```console
  $ git grep string
```

## Branching and Merging (advanced)

### When you clone a repo, you're automatically on master.

### Look at the existing branchs
```console
  $ git branch -a
```

### Checkout a branch
```console
  $ git checkout <branch>
```

### Two ways to get changes into master:
 - Create a feature branch, do development, merge into master. (default)
 - Fork a repo, make changes, create a pull request. (open source projects/no write access to master)

### Create a feature branch, develop, merge to master
```console
  $ git checkout 'master|develop|release'
  $ git checkout -b feature-name
  # Develop the feature.. run tests, etc. do check in
  $ git checkout master
  $ git merge feature-name
```

## Forking a repo (used to make a pull request)
Not really relevant, you should google it.



