Packages:  
bash-completion dua-cli fastfetch git iperf3 jq less nano nethogs nftables nmap openssh pacman-contrib qemu-guest-agent rclone reflector rsync tealdeer

aur:  
ttop-bin yay-bin

pacman.conf:  
enable Color
enable ParallelDownloads

disable debug:  
Open the file /etc/makepkg.conf and search for the line that starts with OPTIONS=. Add an exclamation mark directly before "debug" (i.e. !debug) and save the change. Then no more debug packages should be created in future.
