class LikesController < ApplicationController
    
    

    
    def create
        tweet = Tweet.find(params[:tweet_id])
        unless tweet.liked?(current_user)
            tweet.like(current_user)
        end
        
        #user = User.find_by(uid: session[:uid])
        #user.like_tweets << tweet
        redirect_to tweets_path
    end
    
    def destroy
        tweet = Tweet.find(params[:id])
        tweet.unlike(current_user)
        #user = User.find_by(uid: session[:uid])
        #tweet.likes.find_by(user_id: user.id).destroy
        redirect_to tweets_path
    end
    
    
    
end
