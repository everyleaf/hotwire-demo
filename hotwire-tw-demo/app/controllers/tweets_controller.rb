class TweetsController < ApplicationController
  before_action :find_tweet, only: [:show, :destroy, :like]

  def new
    render "_new"
  end

  def create
    @tweet = Tweet.new(tweet_params)

    unless @tweet.save
      render partial: "new", locals: {tweet: @tweet},  status: :unprocessable_entity
    end
  end

  def index
    scope = Tweet.all

    if params[:icon]
      scope =
        case params[:icon].to_i
          when Tweet.icons[:love]
            scope.love
          when Tweet.icons[:angry]
            scope.angry
          when Tweet.icons[:smile]
            scope.smile
          else
           scope
        end
    end

    @tweets = scope.order(created_at: :desc)
  end

  def show
  end

  def destroy
    @tweet.destroy
    redirect_to action: :index
  end

  def like
    @tweet.like_countup!
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
