#!/bin/sh
#

id=$(xinput list | grep -i "Touchpad" | awk '{print $6}' | sed 's/[^0-9]//g')
able=$(xinput list-props $id | grep "Device Enabled" | awk '{print $4}')
if [[ "$able" == 1 ]]; then
  xinput disable $id
  else
  xinput enable $id
fi
