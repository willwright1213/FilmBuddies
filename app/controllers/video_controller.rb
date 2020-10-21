class VideoController < ApplicationController

  def index
  end

  def watch

  end

  def hoster

    @file = params[:url]

    require "net/http"
    url = URI.parse(HLS)
    req = Net::HTTP.new(url.host, url.port)
    res = req.request_head(url.path) #to get the request code of the stream url
    Dir.chdir(APP_PATH)
    if(!File.file?("lib/scripts/live.rb.pid")) #check if process is not already running

      %x(ruby lib/scripts/live_control.rb start -- #{@file} #{RTMP} -t)
    else
      print "process is already running"  #for console
    end
    # give time for the script to load, once it is loaded, redirect to /test.html
     while res.code == "404" do
      sleep(1)
      req = Net::HTTP.new(url.host, url.port)
      res = req.request_head(url.path)
     end

    redirect_to '/video/watch'
  end

  def host

    @folder = Folder.all

  end

  def configure
    # change quality
  end

  def add
    @folder = Folder.new
    @folder.path = params[:p]
    @folder.save
  end

  def new

  end

end
