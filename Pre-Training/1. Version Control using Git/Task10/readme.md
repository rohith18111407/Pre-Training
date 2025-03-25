# git rebase -i HEAD~n

Interactive rebase for rewriting history.

```
git rebase -i HEAD~2
```

# git push --force origin branch

Force push after history rewrite.

```
git push --force origin feature-branch
```

# git push --force-with-lease

- Safer force push that prevents overwriting remote changes.
- Use git push --force-with-lease instead of --force to prevent overwriting changes made by others.

# git reflog

View history of HEAD movements.

# git checkout <commit-hash>

Restore a lost commit.

```
git checkout master
```
