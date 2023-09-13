#!/bin/sh

# A dwm_bar function to display information regarding system memory, CPU temperature, and storage
# Joe Standring <git@joestandring.com>
# GNU GPLv3

WARNING_LEVEL=80
# df_check_location='/'

dwm_resources () {
	# df_output=$(df -h $df_check_location | tail -n 1)
  USED_RAM=$(free -mh --si | awk  {'print $3'} | head -n 2 | tail -1)
  TOTAL_RAM=$(free -mh --si | awk  {'print $2'} | head -n 2 | tail -1)
	CPU=$(top -bn1 | grep Cpu | awk '{print $2}')%
	CPU_TEMP="$(sensors | grep temp1 | awk 'NR==1{gsub("+", " "); gsub("\\..", " "); print $2}')"
	# STOUSED=$(echo $df_output | awk '{print $3}')
	# STOTOT=$(echo $df_output | awk '{print $2}')
	# STOPER=$(echo $df_output | awk '{print $5}')

	printf "^f3^^c#e39a83^"
	if [ "$CPU_TEMP" -ge $WARNING_LEVEL ]; then
		printf "^f3^󰍛^f2^%s/%s^f2^󰘚^f2^%s^f2^󰈸^f2^%s°C" "$USED_RAM" "$TOTAL_RAM" "$CPU" "$CPU_TEMP"
		# printf "^f3^󰍛^f2^%s/%s^f2^󰘚^f2^%s^f2^󰈸^f2^%s°C^f2^󰋊^f2^%s/%s^f2^%s" "$USED_RAM" "$TOTAL_RAM" "$CPU" "$CPU_TEMP" "$STOUSED" "$STOTOT" "$STOPER"
  else
		printf "^f3^󰍛^f2^%s/%s^f2^󰘚^f2^%s^f2^^f2^%s°C" "$USED_RAM" "$TOTAL_RAM" "$CPU" "$CPU_TEMP"
		# printf "^f3^󰍛^f2^%s/%s^f2^󰘚^f2^%s^f2^^f2^%s°C^f2^󰋊^f2^%s/%s^f2^%s" "$USED_RAM" "$TOTAL_RAM" "$CPU" "$CPU_TEMP" "$STOUSED" "$STOTOT" "$STOPER"
	fi
}

dwm_resources
