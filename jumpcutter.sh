#! /bin/bash
IN=$(echo $@ | grep "\-\-input_file" | awk '{print $1,$2}' | sed 's/--input_file //g')
OUT=$(echo $@ | grep "\-\-output_file" | awk '{print $3,$4}' | sed 's/--output_file //g')
TEMPFOLDER="TEMP$(date +%s)"
CURDIR=$(pwd)

read SPLIT

mkdir $TEMPFOLDER

ffmpeg -i $IN -c copy -map 0 -segment_time $SPLIT -f segment -reset_timestamps 1 $TEMPFOLDER/output%03d.mp4

cd $TEMPFOLDER
for FILE in $(ls .)
do
  mv $FILE $IN
  python ../jumpcutter.py $@
  mv $OUT $FILE
  echo "file '$FILE'" >> mylist.txt
done
ffmpeg -f concat -i mylist.txt -c copy ../$OUT
cd $CURDIR
rm -rf $TEMPFOLDER