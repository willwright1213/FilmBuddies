class NavigatorController < ApplicationController\


  def show
    render :layout => false
  end

  def navigate
    @accepted_format = [".mkv" ,".mp4"]
    @param = params[:url]
    @type = params[:type]
    render 'navigator/show'
  end

end
