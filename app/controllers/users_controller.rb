require 'bcrypt'
class UsersController < ApplicationController
  

    
  def password=(val)
      if val.present?
      self.pass = BCrypt::Password.create(val)
      end
      @password = val
  end
  
  
  def index
    @users = User.all
    #logger.debug @tweets.count
  end
  
  def new
    @user = User.new
  end
  
  def password=(val)
      if val.present?
      self.pass = BCrypt::Password.create(val)
      end
      @password = val
  end
  
  def create
    #pass = BCrypt::Password.create(params[:user][:pass])
    #@user = User.new(uid: params[:user][:uid], pass: pass)
    
    @user = User.new(uid: params[:user][:uid], password: params[:user][:password], password_confirmation: params[:user][:password_confirmation])
    
    #@user = User.new(uid: params[:user][:uid], pass: BCrypt::Password.create(params[:user][:pass]))
    
    
    if @user.save
      redirect_to users_path
    else
      render new_user_path
    end
    #@user.save
    #redirect_to root_path
  end
  
  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path
  end
end
