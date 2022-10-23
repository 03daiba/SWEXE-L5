class TopsController < ApplicationController
  def index
  end
  
  def main
    render 'login'
  end
  
  def login
    user = User.find_by(uid: params[:uid])
    if user and BCrypt::password.new(user.pass) == params[:pass]
      #current_user = user.uid
      session[:login_uid] = user.uid
      redirect_to root_path
    else
      render 'login'
    end
  end
  
  def logout
    session.delete(:login_uid)
    redirect_to root_path
  end
  
  
end
