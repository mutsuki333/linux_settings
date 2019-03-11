# Git notes

### Add a remote repo
1.  Add a new repo in github
2.  Add a new local git repo
    ```shell
    git init
    echo "# repo" > README.md
    git add README.md
    git commit -m "first commit"
    git remote add origin git@github.com:User/UserRepo.git
    git push -u origin master
    ``` 

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

### set case sensitive

`git config core.ignorecase false`

### Markdown syntax highlight
[list](https://github.com/github/linguist/blob/master/lib/linguist/languages.yml)