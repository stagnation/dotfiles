#!/bin/bash
# This scripts detecs unplugging headphones.
# based on http://askubuntu.com/questions/133809/mute-sound-on-headphone-unplug

oldstatus="unrelated string"
cd ~/scratch
while [ 1 ]; do
    sleep 1
    # The following line has to be changed depending on the difference (use diff) in '/proc/asound/card0/code#0'
    #status=$(grep -A 4 'Node 0x16' '/proc/asound/card1/codec#0' |  grep 'Amp-Out vals:  \[0x80 0x80\]')
    file_name=$(date +%s.%N)
    #cp '/proc/asound/card1/codec#0'  '/home/spill/scratch/$file_name'
    cp '/proc/asound/card1/codec#0' $file_name
    #tail $file_name #file name is copied ok
    echo $file_name


    #status=$(grep -A 4 'Control: name="Headphone Jack", index=0, device=0' '/home/spill/scratch/codec#0' |  grep 'Amp-Out vals:  \[0x80 0x80\]')
    status=$(grep -A 6 'Pin Default 0x90170110: ' $file_name |  grep 'OUT')
    echo $status
    rm -f $file_name
    if [ "$status" != "$oldstatus" ]; then
        if [ -n "$status" ]; then
            echo "Unplugged"
             #amixer sset Master playback 10% # Set volume to 80%
             amixer -c 1 -q set Master 20%
             amixer -c 1 sset "Headphone" 100%
            oldstatus="$status"
        else
            echo "plugged in"
            #amixer sset Master playback 10%  # Mute
            amixer -c 1 -q set Master 50%
            amixer -c 1 sset "Headphone" 100%
            oldstatus="$status"
        fi
    fi
done
