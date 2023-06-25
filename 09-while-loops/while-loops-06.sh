#!/bin/bash

FS_NUM=1
# FS=filesystem, MP=mountpoint, REST=remaining fields after mount point
grep xfs /etc/fstab | while read FS MP REST
do
  echo "${FS_NUM}: file system: ${FS}"
  echo "${FS_NUM}: mount point: ${MP}"
  ((FS_NUM++))
done
