#! /bin/bash


# List current barrier processes
BARRIER_PIDS='temp-barrierc-pids.txt'
pidof barrierc > $BARRIER_PIDS

# Kill current barrier processes
# (easier to use pkill maybe)
LINES=$(cat $BARRIER_PIDS)
for LINE in $LINES
do
    if [[ "" != $LINE ]]; then
        sudo kill -9 $LINE
    fi
done

# Start new barrier process

USERNAME='bymyself-Surface-Book'
HOST_IP='192.168.0.133'
BARRIER_LOGS='/home/bymyself/barrier/logs/barrier.logs.txt'

nohup > "$BARRIER_LOGS" sudo barrierc --no-tray --restart --name "$USERNAME" $HOST_IP & disown


