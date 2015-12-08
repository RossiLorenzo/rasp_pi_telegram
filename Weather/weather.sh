#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/h$
  curl "http://api.irishrail.ie/realtime/realtime.asmx/getStationDataByCodeXML_WithNumMins?StationCode=GCDK&NumMins=60" > /home/pi/Lorenzo/Telegram/IrishRail/tmp.txt
  Rscript /home/pi/Lorenzo/Telegram/IrishRail/live_dart.R
