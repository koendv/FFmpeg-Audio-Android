#!/bin/bash
ZIPNAME=ffmpeg_android_binary
rm -f $ZIPNAME.zip
rm -rf $ZIPNAME/
mkdir $ZIPNAME/
for i in build/*/bin/ffmpeg 
do
    TARGET=`echo $i | sed -e 's%build/%%' -e 's%/bin/%_%'`    
    cp $i $ZIPNAME/$TARGET
done
zip -r -9 $ZIPNAME.zip $ZIPNAME/
rm -rf $ZIPNAME/
mv $ZIPNAME.zip release/

