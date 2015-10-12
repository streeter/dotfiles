#!/bin/bash

GARMIN_VOLUME="/Volumes/GARMIN"

if [ ! -e $GARMIN_VOLUME ]; then
  echo "No GPS volume detected!"
  exit -1
fi

GARMIN_ACTIVITIES="${GARMIN_VOLUME}/GARMIN/ACTIVITY"
ACTIVITY_DESTINATION="${HOME}/Dropbox/training/runs"

for activity in "${GARMIN_ACTIVITIES}"/*.FIT
do
  activity_filename=`basename ${activity}`
  destination_filename=`stat -f "%SB" -t "%Y-%m-%d-%H%M%S.fit" ${activity}`
  destination="${ACTIVITY_DESTINATION}/${destination_filename}"
  if [ ! -e ${destination} ]; then
    echo "Copying ${activity_filename} to ${destination_filename}..."
    cp -p ${activity} ${destination}
  else
    echo "${destination_filename} is already copied."
  fi
done
