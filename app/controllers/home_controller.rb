class HomeController < ApplicationController
  def index
    @message = "Greetings Earthlings!"
    @user = session[:user_id] ? User.find(session[:user_id]) : nil
    @band = @user && @user.band_id ? Band.find(@user.band_id) : nil
  end
end
