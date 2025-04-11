# Daily-System-Backup-Script

This is a Bash script that compresses a directory into a `.tar.gz` archive and stores them in a backup folder with logging the backup date

## How to Use

  ###setting up the variables
    - Set "backup_target" variable to the path of target backup file
    - Set "backup_path" and "backup_dir_name" variables to the path for storing the backups
    - Set "logfile_path" and "logfile_name" variables to the path of the logging file
    
  ###make the file executable 

  - use this command  "chmod +x script.sh"

  ###For Daily backup at 12:00 AM

  - open cron job as a root using "sudo crontab -e"
  - write this line "0 0 * * * script.sh"




