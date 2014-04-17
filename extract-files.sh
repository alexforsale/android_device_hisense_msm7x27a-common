#!/bin/sh

VENDOR=hisense
DEVICE=msm7627a-common

BASE=../../../vendor/$VENDOR/$DEVICE/proprietary/

rm -rf $BASE

echo "Pulling common files..."
    adb root
for FILE in `cat proprietary-files.txt | grep -v ^# | grep -v ^$`; do
    DIR=`dirname $FILE`
    if [ ! -d $BASE/$DIR ]; then
        mkdir -p $BASE/$DIR
    fi
    adb pull $FILE $BASE/$FILE
done

./setup-makefiles.sh
