# rsync-homedir-excludes

## Usage:

    # download to `rsync-homedir-local.txt`
    wget https://raw.githubusercontent.com/rubo77/rsync-homedir-excludes/master/rsync-homedir-excludes.txt -O rsync-homedir-local.txt
    # or clone and copy to `rsync-homedir-local.txt`
    git clone https://raw.githubusercontent.com/rubo77/rsync-homedir-excludes
    cd rsync-homedir-excludes
    cp rsync-homedir-excludes.txt rsync-homedir-local.txt

    # edit the file rsync-homedir-local.txt to your needs
    nano rsync-homedir-local.txt

    # define a Backup directory (with trailing slash!)
    # some examples:
    BACKUPDIR=/media/workspace/home/$USER/
    BACKUPDIR=/media/$USER/linuxbackup/home/$USER/
    BACKUPDIR=/media/$USER/USBSTICK/backup/home/$USER/

    # first append the “-n” parameter rsync will simulate the operation. you should use this before you start:
    rsync -naP --exclude-from=rsync-homedir-local.txt /home/$USER/ $BACKUPDIR
		
    #check for permission denied errors in your homedir:
    rsync -naP --exclude-from=rsync-homedir-local.txt /home/$USER/ $BACKUPDIR|grep denied
		
    # if it is all fine, start your backup with
    rsync -aP --exclude-from=rsync-homedir-local.txt /home/$USER/ $BACKUPDIR

You can edit the ignorelist file before execution as it serves you well:

- At the start, there is a section with directories, probably not worth a backup. Uncomment those lines to exclude them as well.

- All lines starting with a `#` are being ignored.

- The syntax doesn't support comments at the end of a line yet.
