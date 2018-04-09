# Mirroring Git Repositories

## Updating

If `git clone https://` -> update with `git pull --all`

If `git clone --mirror` -> update with `git remote -v update`

## Automate updating
 `find . -maxdepth 1 -mindepth 1 -path '*/0mirror' -o -type d -exec bash -c "cd '{}' && pwd && git pull --all" \;`
 `find . -maxdepth 1 -mindepth 1 -type d -exec bash -c "cd '{}' && pwd && git remote -v update" \;`

## Sort Repos by size
 `du -hs * | sort -hr`

## Scripts

### gitinfo.sh

Print commit count on current branch and show last commit:

```sh
Repository commit count: 40
Information about last commit:
commit c52a87610e940ea70200f34413fbf338f5989254
Author: th108 <th108@users.noreply.github.com>
Date:   Wed Jan 17 18:30:10 2018 +0100

    disable pocket
```

### git-checkout-branches.sh

- necessary for **Cgit** to see all branches in web interface

```sh
user@localhost:~/temp/user.js$ git branch
* master

user@localhost:~/temp/user.js$ ~/git-checkout-branches
P: Checking out all remote branches...
Branch relaxed set up to track remote branch relaxed from origin.
Switched to a new branch 'relaxed'
Branch testing set up to track remote branch testing from origin.
Switched to a new branch 'testing'
Switched to branch 'master'
Your branch is up-to-date with 'origin/master'.

user@localhost:~/temp/user.js$ git branch
* master
  relaxed
  testing
```
