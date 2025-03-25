# git rebase -i HEAD~n ( n representing the number of commits)

```
git rebase -i HEAD~3
```

After running git rebase -i HEAD~3, Git opens an editor

Actions You Can Perform

- pick → Keep the commit as is.

- reword → Change the commit message.

- squash (s) → Merge the commit with the previous commit.

- edit → Modify the commit contents.

- drop (d) → Delete the commit.

After saving, Git asks you to modify the commit message

Save and exit.

If no conflicts occur, Git completes the rebase. If conflicts arise, Git will pause the rebase and ask you to resolve them manually.
