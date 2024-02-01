#!/usr/bin/env bash

# Strict mode
set -euo pipefail
IFS=$'\n\t'

# All packages relating to google services
google_services=( \
    #com.google.android.gsf \
    #com.google.android.gms \
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
            #echo ${paths[$count]}, ${packages[$count]}
            #adb pull ${paths[$count]} ${packages[$count]}
            ((++count))
        done
        for j in $paths; do
            adb pull $j
        done
        # im tired, will fix tomorrow probably
        #for ((j=0; j <= ${#paths}; j++)); do
        #echo $j, ${#paths}
        #echo ${paths[$j]}, ${packages[$j]}
        #adb pull ${paths[$j]} ${packages[$j]}
        #done
    done
}

pull_apk ${google_services[*]}
