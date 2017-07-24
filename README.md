# WLStream

The aim for this software is to be able to stream audio from a Windows output device so Pulse Audio will be able to play it back on a Linux host. The communication between the two is done with `plink` from Putty.
This software today prints on stdout the audio data from a Windows output device and also generates a wave file on the end. 

For some reason `pacat` doesn't accept the stream for the command bellow:

```
loopback-capture | plink -v 192.168.11.2 -l rinaldi -pw password "cat - | pacat --playback --format float32le --rate 48000 --volume 30000"
```

But works if first run `loopback-capture` to an output file and them read to the stream with `cat`.

```
loopback-capture.exe > tmp
cat tmp | plink -v 192.168.11.2 -l rinaldi -pw password "cat - | pacat --playback --format float32le --rate 48000 --volume 30000"
```


People have been able to stream from the Windows input device e.g. a microphone as shown in the command bellow:

```
linco.exe -B 16 -C 2 -R 44100 --device 1 | plink -v 192.168.11.5 -l rinaldi -pw password "cat - | pacat --playback"
```

[Originally](https://github.com/mvaneerde/blog/tree/develop/loopback-capture) created by Matthew van Eerde.
