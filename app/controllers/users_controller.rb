class UsersController < ApplicationController
  def new
    @user = User.new()
  end

  def index
    # so we can list all the users
    @users = User.order('email_address ASC')
  end

    # this is where we go when a user selects an existing band
    # {"_method" => "patch", "authenticity_token" => "[FILTERED]", "user" => {"band_id" => "5"}, "commit" => "Vote", "id" => "3"}
  def update
    @band = Band.find(params[:user][:band_id])
    @user = User.find(session[:user_id])

    if @user and @band and @user.update(band_id: @band.id)
      redirect_to results_path
    else
      # this shouldn't happen since we're using existing data, so punt
      redirect_to new_session_path, alert: "Couldn't find user or band. Please try again."
    end
  end
end
