# git cherry-pick <commit-hash>

Applies a specific commit from another branch.
feature-branch (contains a commit with an important fix)
main (where you want to apply that fix)
This applies only the specified commit from feature-branch to main.

```
git cherry-pick abc1234
```

# git cherry-pick --continue

Resolves conflicts and continues the cherry-pick process.
If a conflict occurs, Resolve the conflict manually by editing, then stage the resolved file:

```
git add <filename>
```

Then complete the cherry-pick:

```
git cherry-pick --continue
```

# git cherry-pick --abort

Cancels the cherry-pick and reverts changes.
If a conflict occurs, Resolve the conflict manually by editing, then stage the resolved file:

```
git add <filename>
```

Then complete the cherry-pick:

```
git cherry-pick --abort
```
