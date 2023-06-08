# Twitch Local Player

A local player for twitch designed to be used in a codespace or local network because my playstation's browser cannot play some streams. 
Made thanks to johnvadecano's [node-rtmp-hls](https://github.com/johndavedecano/node-rtmp-hls).

## Requirements

- [FFmpeg](https://ffmpeg.org/) (tested with 6.0 self-built)
- [Streamlink](https://streamlink.github.io/)
- Node.js

## Getting started

Before running the program, first you'll have to change the following line in `start.sh`

```
playlist_url="<source src=\"https://k2helix-probable-space-computing-machine-64xrg4q94q7hxqqp-8000.preview.app.github.dev/hls_${quality}/stream/index.m3u8\" type=\"application/x-mpegURL\">"
```

You need to replace the host (http://k2helix-probable-space-computing-machine-64xrg4q94q7hxqqp-8000.preview.app.github.dev/, **do not delete anything from that / or it will fail**) with the one where you are hosting the server. 

In this case, it is a Github codespace, so the port 8000 needs to be open and public. If it was done in a local host, it'd be something like 192.168.1.x:8000 or whatever the device ip is followed by the port 8000.

### FFmpeg path 

You will also need to change the ffmpeg path to the directory where you have ffmpeg installed. You can change this in the `.env` file and if it still says that it cannot be executed change it directly in `src/config.js`

### Run the program
Once everything is installed and configured, you can run the script with `./start.sh [streamer] [quality]`, where `streamer` is the twitch channel you want to watch and `quality` the quality of the stream provided by Streamlink (480p, 720p60... default is "best").

### Watch the stream
When the program is running, you can head to the host url (the one you set before doing this) and play the stream there. Don't blame me for the html I just wanted it to work. 

![stream running image](https://cdn.discordapp.com/attachments/487962590887149603/1114584817703596043/image.png)

Remember to delete the media folder after you finished watching a stream. If you don't, it will automatically be replaced when you play another stream, so don't worry.