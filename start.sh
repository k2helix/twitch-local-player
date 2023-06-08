stream="${1:-auronplay}"
quality="${2:-best}"
playlist_url="<source src=\"https://k2helix-probable-space-computing-machine-64xrg4q94q7hxqqp-8000.preview.app.github.dev/hls_${quality}/stream/index.m3u8\" type=\"application/x-mpegURL\">"

sed -i "s|<source src.*|${playlist_url}|" ./index.html
cp index.html media/

npm run start:dev & sleep 3 && streamlink https://twitch.tv/${stream} ${quality} --twitch-disable-ads -O | ffmpeg -re -i pipe:0 -c:v copy -c:a aac -ar 44100 -f flv "rtmp://localhost:1935/hls_${quality}/stream"
trap "trap - SIGTERM && kill -- -$$" SIGINT SIGTERM EXIT
