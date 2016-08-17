class TweetsController < ApplicationController
  before_action :set_tweet, only:[:destroy]

  def index
    if params[:back]
      @tweet = Tweet.new(tweets_params)
    else
      @tweet = Tweet.new
    end
    #@tweets = Tweet.all
    @tweets = Tweet.order(created_at: :desc)
  end
  
  def confirm
    @tweet = Tweet.new(tweets_params)
  end
  
  def create
    @tweet = Tweet.new(tweets_params)
    @tweet.save
    redirect_to root_path
  end
  
  def destroy
    @tweet.destroy
    redirect_to tweets_path
  end
  
  private
    def tweets_params
      params.require(:tweet).permit(:content)
    end
    
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end
  
end
