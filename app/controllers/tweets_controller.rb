class TweetsController < ApplicationController
  before_action :set_tweet, only:[:edit, :update, :destroy]

  def index
    
    if params[:back]
      @tweet = Tweet.new(tweets_params)
    else
      @tweet = Tweet.new
    end
    
    #@tweets = Tweet.all
    @tweets = Tweet.order(created_at: :desc)
  end
  
  def new
  end
  
  def confirm
    @tweet = Tweet.new(tweets_params)
    render :new if @tweet.invalid?
  end
  
  def create
    @tweet = Tweet.new(tweets_params)
    if @tweet.save
      redirect_to root_path, notice: "ツイートを投稿しました！"
    else
      #render :new
    end
  end
  
  def edit
    
  end
  
  def update
    if @tweet.update(tweets_params)
      redirect_to root_path, notice: "ツイートを編集しました！"
    else
      render :edit
    end
    
  end 
  
  def destroy
    @tweet.destroy
    redirect_to root_path, notice: "ツイートを削除しました！"
  end
  
  private
    def tweets_params
      params.require(:tweet).permit(:content)
    end
    
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end
  
end
