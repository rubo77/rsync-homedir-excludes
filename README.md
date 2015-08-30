# rsync-homedir-excludes

#Usage:

    download to `/var/tmp/ignorelist`
    rsync -aP --exclude-from=/var/tmp/ignorelist /home/$USER/ /media/$USER/linuxbackup/home/
