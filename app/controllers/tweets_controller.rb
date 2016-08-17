class TweetsController < ApplicationController
  before_action :set_tweet, only:[:destroy]

  def index
    @tweet = Tweet.new
    #@tweets = Tweet.all
    @tweets = Tweet.order(created_at: :desc)
  end
  
  def create
    @tweet = Tweet.new(blogs_params)
    @tweet.save
    redirect_to root_path
  end
  
  def destroy
    @tweet.destroy
    redirect_to tweets_path
  end
  
  private
    def blogs_params
      params.require(:tweet).permit(:content)
    end
    
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end
  
end
