#!/bin/bash

# Prints out battery percentage


get_battery()
{
ICON=""
# rate=$(cat /sys/class/power_supply/BAT1/current_now)
# val=$(cat /sys/class/power_supply/BAT1/charge_now)
# h=$[$val/$rate] 
# m=$[$val*60/$rate-$h*60] 
# printf "rate:%s val:%s h:%s m:%s" "$rate" "$val" "$h" "$m"
# printf "rate:%s val:%s h:%s" "$rate" "$val" "$h" 
capacity=$(cat /sys/class/power_supply/BAT1/capacity)
charging=$(cat /sys/class/power_supply/BAT1/status)
    printf "^f3^"

    if [[ $capacity -ge 60 ]]; then
    printf "^c#89b482^"
    elif [[ $capacity -le 30 ]]; then
    printf "^c#e06c75^"
    else
    printf "^c#EBCB8B^"
    fi

		if [[ "$charging" == "Charging" ]]; then
        ICON=
    else
     if [[ $capacity -le 25 ]]; then
       ICON=
     else
       ICON=󰚦
     fi
    fi
    printf "%s^f2^" "$ICON"

    a=$((capacity/5))
    b=$((23-a))

    # printf "^r0,8,2,5^^r2,5,22,11^"
    # printf "^c#000000^^r3,6,20,8^"

    if [[ $capacity -ge 60 ]]; then
    printf "^r0,8,2,5^^r2,5,22,11^^c#000000^^r3,6,20,9^^c#89b482^^r%s,6,%s,9^^f26^" "$b" "$a"
    elif [[ $capacity -le 30 ]]; then
    printf "^r0,8,2,5^^r2,5,22,11^^c#000000^^r3,6,20,9^^c#e06c75^^r%s,6,%s,9^^f26^" "$b" "$a"
    else
    printf "^r0,8,2,5^^r2,5,22,11^^c#000000^^r3,6,20,9^^c#EBCB8B^^r%s,6,%s,9^^f26^" "$b" "$a"
    fi

    printf "%s%%" "$capacity"
      rate=$(cat /sys/class/power_supply/BAT1/current_now)
      val=$(cat /sys/class/power_supply/BAT1/charge_now)
		if [[ "$rate" > 0 ]]; then
      h=$[$val/$rate] 
      m=$[$val*60/$rate-$h*60] 
      printf "^f2^%sh%sm" "$h" "$m"
    fi
}

get_battery
