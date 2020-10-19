class NavigatorController < ApplicationController\


  def show
    render :layout => false
  end

  def navigate
    @param = params[:url]
    render 'navigator/show'
  end

end
