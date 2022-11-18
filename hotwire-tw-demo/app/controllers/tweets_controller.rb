class TweetsController < ApplicationController
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

  private

  def tweet_params
    params.require(:tweet).permit([:icon, :name, :body])
  end
end
