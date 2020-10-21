# README

FilmBuddies is a video server application for streaming (Think Plex). 

- Ruby version: 2.7.2
- Rails version: 6.0.3.3

## installation

FilmBuddies requires nginx installed with the nginx_rtmp_module. If you have nginx already
installed, but not with the nginx_rtmp_module, you will have to recompile. If you wish to deploy filmBuddies with Passenger, then you would need to compile with the 
Passenger module.

```bash
git clone https://github.com/arut/nginx-rtmp-module.git
git clone https://github.com/nginx/nginx.git
cd nginx
./configure [your config] --add-module=../nginx-rtmp-module
```

Videos are encoded with ffmpeg using the libx264 codec. Run "ffmpeg" in the terminal
to check if --enable-libx264 is in the configuration

filmBuddies currently makes use of HLS, which can be activated in your nginx configuration
file. So make sure that it is on. To install filmBuddies, simply follow the instructions

```bash
git clone https://github.com/willwright1213/FilmBuddies.git
cd filmBuddies
bundle install
```

#setup

There is a file called setup.default.rb in the config folder that looks like this

````ruby
#location of the rails app
    APP_PATH  = '/Path/To/filmBuddies/'
    #rtmp server
    RTMP = 'rtmp://rtmp/server/where/it/is/hosted'
    #hls file location
    HLS = 'http://location/of/m3u8/file'
    #video folder
    VIDEO_FOLDER = '/path/to/video/folders'
````

#Running

hosting a video begins at /video/host. A list of folders and video from the designed VIDEO_FOLDER variable
will show. To start a video, double click the file. 

Change the values accordingly and rename the file to setup.rb