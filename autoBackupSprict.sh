#!/bin/bash

#バックアップ元の絶対パス
BackupSource="/TestingSpace/autoBackupSprict/backupSource"
#バックアップ先の絶対パス
BackupDestination="/TestingSpace/autoBackupSprict/backupDestination"
#逆増分バックアップによって消去されたファイルの保存場所
tmp="/TestingSpace/autoBackupSprict/tmp"

#必要パッケージの確認とインストール
apt-get update>/dev/null

package=("rsync" "tree")
for serch in "${package[@]}"
do

dpkg -s "$serch">/dev/null 2>&1
if [ ! $? -eq 0 ]; then
apt install -y "$serch"
fi

done

#バックアップ
rsync -av --delete  --backup --backup-dir='.tmp/deletedata-'$(date +%Y'/'%m'/'%d-%H:%M:%S) "$BackupSource" "$BackupDestination"