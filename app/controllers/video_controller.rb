class VideoController < ApplicationController

  def index
  end

  def watch

    require 'pathname'
    @video_file = Pathname.new('/tmp/hls/test.m3u8')


    # Controller for when a stream is being hosted.
  end

  def host
    require "net/http"
    url = URI.parse("http://localhost:8080/test.m3u8")
    req = Net::HTTP.new(url.host, url.port)
    res = req.request_head(url.path)
    test = "/home/william/Downloads/cage.mp4"
    #check if process is not already running
    puts test
     if(!File.file?("lib/scripts/test.rb.pid"))
      %x(ruby lib/scripts/test_control.rb start -- #{test})
    else
      print "process is already running"
    end
   # give time for the script to load, once it is loaded, redirect to /test.html
    while res.code == "404" do
      sleep(1)
       req = Net::HTTP.new(url.host, url.port)
      res = req.request_head(url.path)
     end

    redirect_to '/test.html'
  end

  def configure
    # change quality
  end

  def add
    @folder = Folder.new(params[:path])
  end

  def new
    @folder = Folder.new
  end

end
