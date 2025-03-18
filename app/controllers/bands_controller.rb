class BandsController < ApplicationController
  def index
    @bands = Band.all()
    @band = Band.new()
    @session = session
    @user_id = session[:user_id]
    @user = User.find(session[:user_id])
  end

  # this is where we go when a user adds a new band
  # new band: {"authenticity_token" => "[FILTERED]", "band" => {"name" => "reo speedwagon"}, "commit" => "Vote"}
  def create
    if !(@band = Band.create(params.require(:band).permit(:name)))
      # well this is odd...
      redirect_to band_path, alert: "That didn't work. Very odd..."
    end

    @user = User.find(session[:user_id])
    if @user.update(band_id: @band.id)
      redirect_to results_path
    else
      redirect_to band_path, alert: "Could not update user record"
    end
  end
end
