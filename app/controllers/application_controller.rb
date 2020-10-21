
class ApplicationController < ActionController::Base
  require_relative '../../config/setup.rb'
  protect_from_forgery with: :null_session
end
