#!/bin/bash

#Compressing

backup_target=~/data
backup_path=~
backup_dir_name=backups
logfile_path=~/backups
logfile_name=backups_logfile.log
backup_file_name="backup_$(date +%Y-%m-%d_%H-%M-%S).tar.gz" 


#The traget directory must be exist

compress() {
    #Compressing

    #check backup directory exists, if it doesn't exist create it

    if [ ! -f "$backup_path/$backup_dir_name" ]; then
        mkdir $backup_path/$backup_dir_name
    fi


    echo "Compressing '$backup_target' directory"

    tar -czf "$backup_path/$backup_dir_name/$backup_file_name" $backup_target > /dev/null 2>&1
}


log() {

    #Logging

    #check log file exists, if it doesn't exist create it

    if [ ! -f "$logfile_path/$logfile_name" ]; then
        touch $logfile_path/$logfile_name
    fi

    log_message="'$backup_target' Backup Completed Successfully at $backup_path/$backup_dir_name/$backup_file_name"

    tail -n 4 $logfile_path/$logfile_name > $logfile_path/temp

    echo $log_message >> $logfile_path/temp

    rm $logfile_path/$logfile_name

    mv $logfile_path/temp $logfile_path/$logfile_name

    echo $log_message
}


if [ ! -d $backup_target ]; then
    echo "Target directory doesn't exist! at $backup_target"
else
    compress
    log
fi
