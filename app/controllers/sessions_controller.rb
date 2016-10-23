class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']
    redirect_to login_failure_path unless auth_hash['uid']

    @user = User.find_by(uid: auth_hash[:uid], provider: 'github')
    if @user.nil?
      # User doesn't match anything in the DB.
      # Attempt to create a new user.
      @user = User.build_from_github(auth_hash)
      render :creation_failure unless @user.save
    end

    session[:user_id] = @user.id
    redirect_to sessions_path
  end

  def index
    if session[:user_id].nil?
      redirect_to login_failure_path
    else
      @user = User.find(session[:user_id])
      #implicit render :index when there is a successful login

    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end

  def login_failure
  end
end
