#!/sbin/sh

if [ ! -f "/system/lib/hw/*.goldfish.so" ]; then
rm /system/lib/hw/*.goldfish.so
fi
