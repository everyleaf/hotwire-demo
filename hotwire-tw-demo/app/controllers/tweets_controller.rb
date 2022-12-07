class TweetsController < ApplicationController
  before_action :find_tweet, only: [:show, :destroy, :like]

  def new
  end

  def create
    @tweet = Tweet.new(tweet_params)

    if @tweet.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def index
    @tweets = Tweet.order(created_at: :desc)
  end

  def show
  end

  def destroy
    @tweet.destroy
    redirect_to action: :index
  end

  def like
    @tweet.update!({like_count: @tweet.like_count + 1})
    redirect_to @tweet
  end

  private

  def find_tweet
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit([:icon, :name, :body])
  end
end
