class SessionsController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]
  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to new_session_url, alert: "Try again later." }

  def new
  end

  def create
    email_address = params.require(:email_address)
    password = params.require(:password)
    zipcode = params.require(:zipcode)

    # look up existing OR create a new user
    @user = User.find_by(email_address: email_address) || 
            User.create(email_address: email_address, password: password, zipcode: zipcode)
    if @user
      start_new_session_for @user
      session[:user_id] = @user.id
      #redirect_to after_authentication_url
      redirect_to bands_path
    else
      redirect_to new_session_path, alert: "Try another email address or password."
    end
  end

  def destroy
    puts "DESTROY SESSION"
    terminate_session
    redirect_to new_session_path
  end
end

