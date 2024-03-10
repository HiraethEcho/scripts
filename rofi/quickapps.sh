#!/usr/bin/env bash

## Author  : Aditya Shakya (adi1090x)
## Github  : @adi1090x
#
## Applets : Favorite Applications

# Import Current Theme
theme="~/.config/rofi/themes/quick.rasi"

win_width='690px'
# Theme Elements
prompt='Applications'
list_col='3'
list_row='5'

# CMDs (add your apps here)
web_cmd='microsoft-edge-stable'
watt_cmd='watt-toolkit'
zotero_cmd='zotero'
obsidian_cmd='obsidian'
file_cmd='pcmanfm'
blue_tooth_cmd='blueman-manager'
wifi_cmd='iwgtk'
whale_cmd='whale'
volume_cmd='pavucontrol'
text_cmd='alacritty -e nvim'
onedrive_cmd='onedrivegui'
battery_cmd='slimbookbattery'
wechat_cmd='wechat-uos'
rss_cmd='fluent-reader'
office_cmd='libreoffice'
mail_cmd='thunderbird'
#  
# Options
option_1=" Edge "
option_2="󰓓 Steam++"
option_3=" Zotero "
option_4=" Obsidian "
option_5="󰇮 Mail "
option_6=" BlueTooth "
option_7=" Wifi "
option_8=" Whale "
option_9="󱄠 Volume "
option_10=" Editor "
option_11=" Onedrive "
option_12="󰌪 Battery "
option_13="󰘑 Wechat"
option_14=" Rss Reader"
option_15="󰏆 Office"


# Rofi CMD
    # -mesg "$mesg" \
rofi_cmd() {
  rofi -theme-str "listview {columns: $list_col; lines: $list_row;}" \
    -theme-str "window {width: $win_width;}" \
    -theme-str 'textbox-prompt-colon {str: "";}' \
    -dmenu \
    -p "$prompt" \
    -markup-rows \
    -theme ${theme}
}

# Pass variables to rofi dmenu
run_rofi() {
  echo -e "$option_1\n$option_2\n$option_3\n$option_4\n$option_5\n$option_6\n$option_7\n$option_8\n$option_9\n$option_10\n$option_11\n$option_12\n$option_13\n$option_14\n$option_15" | rofi_cmd
}

# Execute Command
run_cmd() {
  if [[ "$1" == '--opt1' ]]; then
    ${web_cmd}
  elif [[ "$1" == '--opt2' ]]; then
    ${watt_cmd}
  elif [[ "$1" == '--opt3' ]]; then
    ${zotero_cmd}
  elif [[ "$1" == '--opt4' ]]; then
    ${obsidian_cmd}
  elif [[ "$1" == '--opt5' ]]; then
    ${mail_cmd}
  elif [[ "$1" == '--opt6' ]]; then
    ${blue_tooth_cmd}
  elif [[ "$1" == '--opt7' ]]; then
    ${wifi_cmd}
  elif [[ "$1" == '--opt8' ]]; then
    ${whale_cmd}
  elif [[ "$1" == '--opt9' ]]; then
    ${volume_cmd}
  elif [[ "$1" == '--opt10' ]]; then
    ${text_cmd}
  elif [[ "$1" == '--opt11' ]]; then
    ${onedrive_cmd}
  elif [[ "$1" == '--opt12' ]]; then
    ${battery_cmd}
  elif [[ "$1" == '--opt13' ]]; then
    ${wechat_cmd}
  elif [[ "$1" == '--opt14' ]]; then
    ${rss_cmd}
  elif [[ "$1" == '--opt15' ]]; then
    ${office_cmd}
  fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $option_1)
    run_cmd --opt1
        ;;
    $option_2)
    run_cmd --opt2
        ;;
    $option_3)
    run_cmd --opt3
        ;;
    $option_4)
    run_cmd --opt4
        ;;
    $option_5)
    run_cmd --opt5
        ;;
    $option_6)
    run_cmd --opt6
        ;;
    $option_7)
    run_cmd --opt7
        ;;
    $option_8)
    run_cmd --opt8
        ;;
    $option_9)
    run_cmd --opt9
        ;;
    $option_10)
    run_cmd --opt10
        ;;
    $option_11)
    run_cmd --opt11
        ;;
    $option_12)
    run_cmd --opt12
        ;;
    $option_13)
    run_cmd --opt13
        ;;
    $option_14)
    run_cmd --opt14
        ;;
    $option_15)
    run_cmd --opt15
        ;;
esac
