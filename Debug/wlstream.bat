if not DEFINED IS_MINIMIZED set IS_MINIMIZED=1 && start "" /min "%~dpnx0" %* && exit
loopback-capture | plink -v 192.168.11.2 -l user -pw password "cat - | pacat --playback --format float32le --rate 48000 --volume 30000"
exit
