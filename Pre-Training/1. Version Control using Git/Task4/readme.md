# git status

- The git status command shows the state of the working directory and the staging area.
- It helps you see which files are untracked, modified, or staged.

```
git status
```

# git diff

- This command shows the differences between:
- The working directory and the staging area.
- The staged changes and the last commit.

```
git diff --staged
```

# git merge

- Merges changes from one branch into another (typically merging a feature branch into main or master).

- Switch to the branch you want to merge into (e.g., main)

```
git checkout main
```

- Merge another branch (e.g., feature-branch)

```
git merge feature-branch
```

- You must edit index.html to resolve the conflict, then run

```
git add index.html
git commit -m "Resolved merge conflict in index.html"
```

# git add

- Stages changes for the next commit.

- Stage a single file:

```
git add index.html
```

- Stage multiple files:

```
git add index.html style.css
```

- Stage all changes (including new, modified, and deleted files)

```
git add .
```

# git commit

- Saves staged changes to the repository.

- Commit with a message:

```
git commit -m "Added a new paragraph to index.html"
```

- Commit all changes (without git add)

```
git commit --amend -m "Updated index.html with a new heading"
```

# git log

- Shows the commit history of the repository.

```
git log
```

- One-line log summary:

```
git log --oneline
```
