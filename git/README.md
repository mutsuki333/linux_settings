# Git notes
### Remove a added file
if the file is not in the repo : `git rm --cached <file>`
If the file is still in the repo : `git reset HEAD <file>`

### clone subdir/file only

```shell
git init <repo>
cd <repo>
git remote add origin <url>
git config core.sparsecheckout true
echo "path/to/file" >> .git/info/sparse-checkout
git pull --depth=1 origin master
```
