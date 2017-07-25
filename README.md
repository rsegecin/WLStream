# WLStream

The aim for this software is to be able to stream audio from a Windows output device so Pulse Audio will be able to play it back on a Linux host. The communication between the two is done with `plink` from Putty. `loopback-capture` prints on stdout data formated as `PCM floating signed 32 bits little endian` from a Windows output device. You also can list the available devices, choose a specific device, create a wav file and chose the PCM's size.

```
loopback-capture.exe (Starts to dump audio data from the first playback device found)

-h or ?          prints this message.
--device         captures from the specified device (default if omitted)
--file           saves the output to a wav file
--int-16         attempts to coerce data to 16-bit integer format
--lsdev          list devices displays the long names of all active playback devices.

Usage: loopback-capture.exe [--device "Device long name"] [--file "file name"] [--int-16]
E.g: loopback-capture.exe --device "Speakers(Realtek High Definition Audio)" --file "output.wav"
```

Follows the command to stream the data:

```
loopback-capture | plink -v 192.168.11.2 -l user -pw password "cat - | pacat --playback --format float32le --rate 48000 --volume 30000"
```

People have also been able to stream from the Windows input device e.g. a microphone as shown in the command bellow:

```
linco.exe -B 16 -C 2 -R 44100 --device 1 | plink -v 192.168.11.5 -l user -pw password "cat - | pacat --playback"
```
# "Install"
- Have plink and [Putty](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html) installed and configured in your Environment Variables Path.
- Download this repository and execute the command in the "Debug" directory or use the WLStream icon.
- To use the WLStream icon don't forget to change `wlstream.bat` file contained in the "Debug" directory with the correct linux host's ipAddress and login infos (better connect through ssh before to check connection with your device).
- Make sure your Linux device is running [PulseAudio](https://www.freedesktop.org/wiki/Software/PulseAudio/).

# ToDo
- Create a cool WLStream icon design.

**This code was an adaptation made by [Rinaldi Segecin](https://github.com/rsegecin) from [this code](https://github.com/mvaneerde/blog/tree/develop/loopback-capture) by Matthew van Eerde.**