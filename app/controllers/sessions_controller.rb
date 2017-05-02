class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    # raise user.inspect
    if user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:error] = "Your username and password do not match."
      render 'new'
    end
  end

  def destroy
    if session[:user_id]
      session.delete(:user_id)
      redirect_to root_path
    end
  end

end
