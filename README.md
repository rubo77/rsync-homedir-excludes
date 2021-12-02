# rsync-homedir-excludes
This project maintains a list of directories and files you probably do not need to back up, which you can pass to the `rsync` command's `--exclude-from` option.

## Usage:

    # download to `rsync-homedir-local.txt`
    wget https://raw.githubusercontent.com/rubo77/rsync-homedir-excludes/master/rsync-homedir-excludes.txt -O rsync-homedir-local.txt
    # or clone and copy to `rsync-homedir-local.txt`
    git clone https://github.com/rubo77/rsync-homedir-excludes
    cd rsync-homedir-excludes
    cp rsync-homedir-excludes.txt rsync-homedir-local.txt

    # edit the file rsync-homedir-local.txt to your needs
    nano rsync-homedir-local.txt

    # define a Backup directory (with trailing slash!)
    # some examples:
    BACKUPDIR=/media/workspace/home/$USER/
    BACKUPDIR=/media/$USER/linuxbackup/home/$USER/
    BACKUPDIR=/media/$USER/USBSTICK/backup/home/$USER/

    # first specify the "-n" parameter so rsync will simulate its operation. You should use this before you start:
    rsync -naP --exclude-from=rsync-homedir-local.txt /home/$USER/ $BACKUPDIR

    # check for permission denied errors in your homedir:
    rsync -naP --exclude-from=rsync-homedir-local.txt /home/$USER/ $BACKUPDIR|grep denied

    # if it is all fine, actually perform your backup:
    rsync -aP --exclude-from=rsync-homedir-local.txt /home/$USER/ $BACKUPDIR

    # makes your backup incremental:
    SNAPSHOT_DIR="$BACKUPDIR.$(date --iso-8601=seconds -u)"
    cp -al $BACKUPDIR $SNAPSHOT_DIR

You can edit the exclude file before execution:
- All lines starting with a `#` are ignored by rsync, i.e. those directories will be backed up.
- The syntax doesn't support comments at the end of a line yet.
- At the start there is a section with directories that are probably not worth backing up. Uncomment those lines to exclude them as well.
