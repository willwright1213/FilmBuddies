system("ffmpeg -re -i " + ARGV[0] + " -c:a aac -c:v libx264 -b:v 10m -b:a 800k -f flv rtmp://localhost/live/movie")

