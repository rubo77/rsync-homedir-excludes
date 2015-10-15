# rsync-homedir-excludes

#Usage:

    download to `/var/tmp/ignorelist`
    rsync -aP --exclude-from=/var/tmp/ignorelist /home/$USER/ /media/$USER/linuxbackup/home/$USER/

At the start, there is a section with directories, probably not worth a backup. Uncomment those lines to exclude them as well.