system("ffmpeg -i /home/william/Downloads/cage.mp4 -c:a aac -c:v libx264 -preset veryfast -f flv rtmp://localhost/live/test")

