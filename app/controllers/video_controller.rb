class VideoController < ApplicationController

  def index
  end

  def watch

  end

  def hoster

    @file = params[:url]

    require "net/http"
    url = URI.parse("http://localhost:8080/movie.m3u8")
    req = Net::HTTP.new(url.host, url.port)
    res = req.request_head(url.path) #to get the request code of the stream url

    if(!File.file?("/lib/scripts/test.rb.pid")) #check if process is not already running
      %x(ruby /home/william/filmBuddies/lib/scripts/test_control.rb start -- #{@file})
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
