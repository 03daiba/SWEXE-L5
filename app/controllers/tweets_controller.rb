require 'bcrypt'
class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
    #logger.debug @tweets.count
  end
  
  def new
    @tweet = Tweet.new
  end
  
  def create
    #pass = BCrypt::Password.create(params[:user][:pass])
    #@user = User.new(uid: params[:user][:uid], pass: pass)
    user = User.find_by(uid: session[:uid])
    @tweet = Tweet.new(messeage: params[:tweet][:messeage], tdate: Time.current, user_id: user.id)
    if @tweet.save
      redirect_to tweets_path
    else
      render new_Tweet_path
    end
    #@user.save
    #redirect_to root_path
  end
  
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to tweets_path
  end
end
