#!/usr/bin/env bash

# Strict mode
set -euo pipefail
IFS=$'\n\t'

# All packages relating to google services
google_services=( \
    com.google.android.gsf \
    com.google.android.gms \
    com.android.vending \
)

# Pulls the package's apk from the device to the local folder
pull_apk() {
    for i in $@; do
        apk_paths=$(adb shell pm path "$i" | cut -f 2 -d ":")
        packages=$(echo "$apk_paths" | grep -Po '(?<=split_).+?(?=\.apk)|base')
        for j in $packages; do
            if [[ $j != "base" ]]; then
                j="$j.apk"
            else
                j="$i.apk"
            fi
            echo $j
        done
        #adb pull "$j" "$apk"
    done
}

pull_apk ${google_services[*]}
