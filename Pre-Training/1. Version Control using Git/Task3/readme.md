# Undo uncommitted changes

# git checkout -- <filename>

- Undo uncommited changes are done
- Modifying index.html and undoing it before it is committed can be done using:

```
git checkout -- index.html
```

- Now modifying index.html and readme.md file before it is committed:

```
git checkout -- .
```

# Undo committed changes using

# git revert <commitid>

- git revert <commit_id_you_need_to_revert> and this will automatically make new commit after reverting the changes

```
git revert c9635dee62cd
```

- To commit explicitly instead of making automatic commit then run git revert -n <commit_id_you_want_to_revert>, assume revert operation is carried out in index.html

```
git revert -n c9635dee62cd
git add index.html
git commit -m "revert to original state"
```

- Explicit commit message is displayed in log

# Resetting changes

# git reset --hard <commit id>

- Now in order to make whatever changes after the selected commit id is not needed in history of logs then use this git reset –hard <commit_id> command

```
git reset --hard c9635dee62cd
```

- Log entries after the reset command commit id will be removed
