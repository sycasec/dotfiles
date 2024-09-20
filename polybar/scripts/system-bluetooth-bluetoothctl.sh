#!/bin/sh

bluetooth_print() {
    bluetoothctl | grep --line-buffered 'Device\|#' | while read -r REPLY; do
        # if [ "$(systemctl is-active "bluetooth.service")" = "active" ]; then
        if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]; then
            echo "%{F#7f849c}"
        else 
            devices_paired=$(bluetoothctl devices Paired | grep Device | cut -d ' ' -f 2)
            counter=0


            for device in $devices_paired; do
                device_info=$(bluetoothctl info "$device")

                if echo "$device_info" | grep -q "Connected: yes"; then
                    device_output=$(echo "$device_info" | grep "Alias" | cut -d ' ' -f 2-)
                    device_battery_percent=$(echo "$device_info" | grep "Battery Percentage" | awk -F'[()]' '{print $2}')

                    if [ -n "$device_battery_percent" ]; then
                        if [ "$device_battery_percent" -gt 90 ]; then
                            device_battery_icon="%{F#a6e3a1}󰁹"
                        elif [ "$device_battery_percent" -gt 60 ]; then
                            device_battery_icon="%{F#a6e3a1}󰂁"
                        elif [ "$device_battery_percent" -gt 35 ]; then
                            device_battery_icon="%{F#f9e2af}󰁿"
                        elif [ "$device_battery_percent" -gt 15 ]; then
                            device_battery_icon="%{F#f5c2e7}󰁽"
                        else
                            device_battery_icon="%{F#f38ba8}󰁻"
                        fi

                        device_output="%{F#74c7ec} %{F#cdd6f4}$device_output $device_battery_icon $device_battery_percent%"
                    fi

                    if [ $counter -gt 0 ]; then
                        printf ", %s" "$device_output"
                    else
                        printf " %s" "$device_output"
                    fi

                    counter=$((counter + 1))
                fi
            done
            echo "%{F#74c7ec}"
        fi
    done
}

bluetooth_toggle() {
    if bluetoothctl show | grep -q "Powered: no"; then
        bluetoothctl power on >> /dev/null
        sleep 1

        devices_paired=$(bluetoothctl devices Paired | grep Device | cut -d ' ' -f 2)
        echo "$devices_paired" | while read -r line; do
            bluetoothctl connect "$line" >> /dev/null
        done
    else
        devices_paired=$(bluetoothctl devices Paired | grep Device | cut -d ' ' -f 2)
        echo "$devices_paired" | while read -r line; do
            bluetoothctl disconnect "$line" >> /dev/null
        done

        bluetoothctl power off >> /dev/null
    fi
}

case "$1" in
    --toggle)
        bluetooth_toggle
        ;;
    *)
        bluetooth_print
        ;;
esac
