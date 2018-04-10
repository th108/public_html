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

## Automatic Updating

Create `/etc/systemd/system/update_git.service` first:

```sh
[Unit]
Description=Update all git repos in ~/mirrorGit
After=network.target

[Service]
Type=oneshot
User=user
ExecStart=/bin/sh -c '/home/user/mirrorGit/.update.sh >> /tmp/log-update_git'
```

Then create timer unit with the same name but with *.timer suffix `/etc/systemd/system/date.timer`:

```sh
[Unit]
Description=Run update_git.service at 5AM and 10PM

[Timer]
OnCalendar=*-*-* 5,22:00
RandomizedDelaySec=1h
Persistent=true

[Install]
WantedBy=timers.target
```

This config will run `update_git.service` every day at 5AM and 10PM with 1h variation.

**NOTE:**

If you decide to change the backup frequency, after modifying timer service, don’t forget to type:

`systemctl daemon-reload`

File `.update.sh` should contain:

```sh
#!/bin/sh

date

#update ~/mirrorGit
/usr/bin/find /home/user/mirrorGit -maxdepth 1 -mindepth 1 -path '*/0mirror' -o -type d -exec bash -c "cd '{}' && pwd && git pull --all" \;

#update ~/mirrorGit/0mirror
/usr/bin/find /home/user/mirrorGit/0mirror -maxdepth 1 -mindepth 1 -type d -exec bash -c "cd '{}' && pwd && git remote -v update" \;

echo
```

Add `update_git` to start-up: `systemctl enable update_git.timer`

Start: `systemctl start update_git.timer`

Check if working: `systemctl list-timers`

```sh
NEXT                          LEFT          LAST                          PASSED    UNIT                         ACTIVATES
Tue 2018-04-10 22:52:58 CEST  2h 16min left Tue 2018-04-10 05:40:25 CEST  14h ago   update_git.timer             update_git.service
```
