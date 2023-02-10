#!/bin/bash

#バックアップ元の絶対パス
BackupSource="/TestingSpace/backupSource/"
#バックアップ先の絶対パス
BackupDestination="/TestingSpace/backupDestination"
#逆増分バックアップによって消去されたファイルの保存場所
tmp="/TestingSpace/tmp"

dpkg -s rsync>/dev/null 2>&1
if [ ! $? -eq 0 ]; then
apt install -y rsync
fi

rsync -av --delete  --backup --backup-dir='/TestingSpace/autBackupSprict/tmp/deletedata-'$(date +%Y'/'%m'/'%d-%H:%M:%S) ./backupSource/ ./backupDestination/