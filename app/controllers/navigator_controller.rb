class NavigatorController < ApplicationController


  def show
    render :layout => false
  end

  def navigate
    @accepted_format = [".mkv" ,".mp4"]
    if(params[:url] == 'initiate')
      @param = VIDEO_FOLDER
    else
      @param = params[:url]
    end
    @type = params[:type]
    render 'navigator/show'
  end

end
