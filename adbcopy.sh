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
        paths=$(adb shell pm path "$i" | cut -f 2 -d ":")
        packages=$(echo "$paths" | grep -Po '(?<=split_).+?(?=\.apk)|base')
        count=0
        for j in $packages; do
            #echo ${packages[$count]}
            packages[$count]=$(if [[ "$j" != "base" ]]; then
                echo "$j.apk"
            else
                echo "$i.apk"
            fi)
            echo ${packages[$count]}
            ((++count))
        done
        #adb pull "$j" "$apk"
    done
}

pull_apk ${google_services[*]}
