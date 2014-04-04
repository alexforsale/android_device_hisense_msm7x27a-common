#!/bin/sh

VENDOR=hisense
DEVICE=msm7627a-common

BASE=../../../vendor/$VENDOR/$DEVICE/proprietary

echo "Pulling common files..."
    adb root
for FILE in `cat proprietary-files.txt | grep -v ^# | grep -v ^$`; do
    DIR=`dirname $FILE`
    if [ ! -d $BASE/$DIR ]; then
        mkdir -p $BASE/$DIR
    fi
    adb pull $FILE $BASE/$FILE
done

#echo "hack for built with prebuilt kernel"
#cp include/* ../../../out/target/product/AD683G/obj/ -r

./setup-makefiles.sh
