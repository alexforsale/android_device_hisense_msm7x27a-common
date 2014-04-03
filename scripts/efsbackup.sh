#!/sbin/sh

if [ ! -d "/sdcard/EFS_BACKUPS" ]; then
mkdir /sdcard/EFS_BACKUPS
fi
#Backup MODEM_BACKUP
if [ ! -f "/sdcard/EFS_BACKUPS/MODEM_BACKUP.img" ]; then
dd if=/dev/block/mmcblk0p9 of=/sdcard/EFS_BACKUPS/MODEM_BACKUP.img
fi
#Backup MODEM_ST1
if [ ! -f "/sdcard/EFS_BACKUPS/MODEM_ST1.img" ]; then
dd if=/dev/block/mmcblk0p10 of=/sdcard/EFS_BACKUPS/MODEM_ST1.img
fi
#Backup MODEM_ST2
if [ ! -f "/sdcard/EFS_BACKUPS/MODEM_ST2.img" ]; then
dd if=/dev/block/mmcblk0p11 of=/sdcard/EFS_BACKUPS/MODEM_ST2.img
fi

