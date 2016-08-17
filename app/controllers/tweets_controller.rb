class TweetsController < ApplicationController
  def index
    @tweet = Tweet.new
    @tweets = Tweet.all
  end
  
  def create
    @tweet = Tweet.new(blogs_params)
    @tweet.save
    redirect_to root_path
  end
  
  private
    def blogs_params
      params.require(:tweet).permit(:content)
    end
  
end
