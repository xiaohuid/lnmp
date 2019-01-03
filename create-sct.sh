#!/bin/sh

RN=1

while read p; do

echo $p $RN

ct-submit/ct-submit $p < /etc/letsencrypt/live/www.xiaohui.org/fullchain.pem >/root/cert/scts/${RN}.sct

RN=`expr $RN + 1`

done <<EOF
ct.googleapis.com/icarus
ct.googleapis.com/pilot
ct.googleapis.com/rocketeer
ct.googleapis.com/skydiver
ct1.digicert-ct.com/log
EOF

