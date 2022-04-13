# File that contains functions for menues and browsing

main_menu () {
  echo "Please, choose an option:"
  echo "1 .- Virus scan options" >&2
  echo "2 .- Analyse directories" >%2
  echo "3 .- Whatever..." >&2
}
antivirus(){
#!/bin/bash
LOGFILE="/var/log/clamav/clamav-$(date +'%Y-%m-%d').log";
DIRTOSCAN=".";

for S in ${DIRTOSCAN}; do
 DIRSIZE=$(du -sh "$S" 2>/dev/null | cut -f1);

 echo "Starting a daily scan of "$S" directory.
 Amount of data to be scanned is "$DIRSIZE".";

 clamscan -ri "$S" >> "$LOGFILE";

 # get the value of "Infected lines"
 MALWARE=$(tail "$LOGFILE"|grep Infected|cut -d" " -f3);


 if [ "$MALWARE" -ne "0" ];then
 echo "Malware Found";
 fi
done

backup() {
#!/bin/bash
####################################
#
# Backup to NFS mount script.
#
####################################

# What to backup.
backup_files="/home /var/spool/mail /etc /root /boot /opt"

# Where to backup to.
dest="/mnt/backup"

# Changing permission
chown root -R "$BKPATH"
chown root "$logfile"

# Create archive filename.
day=$(date +%A)
hostname=$(hostname -s)
archive_file="$hostname-$day.tgz"

# removing old files and temporary files
find "$BKPATH" -name "daily_backup*" -mtime +2 -exec rm {} \;
rm "$dumpdatabase"
echo "old files deleted" >> "$logfile"
echo "operation finished at $(date +'%d-%m-%Y %H:%M:%S')" >> "$logfile"

# Print start status message.
echo "Backing up $backup_files to $dest/$archive_file"
date
echo

# Backup the files using tar.
tar czf $dest/$archive_file $backup_files

# Print end status message.
echo
echo "Backup finished"
date

# Long listing of files in $dest to check file sizes.
ls -lh $dest

exit 0
}
}


