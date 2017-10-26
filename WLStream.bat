WLStream | plink -v 192.168.11.9 -l user -pw password "cat - | pacat --latency-msec=10 --playback --format float32le --rate 44100 --volume 30000"
