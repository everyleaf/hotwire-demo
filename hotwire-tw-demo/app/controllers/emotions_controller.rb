class EmotionsController < ApplicationController
  before_action :find_emotion, only: [:show, :destroy, :like]

  def new
    render "_new"
  end

  def create
    @emotion = Emotion.new(emotion_params)

    unless @emotion.save
      render partial: "new", locals: {emotion: @emotion},  status: :unprocessable_entity
    end
  end

  def index
    scope = Emotion.all

    if params[:icon]
      scope =
        case params[:icon].to_i
          when Emotion.icons[:love]
            scope.love
          when Emotion.icons[:angry]
            scope.angry
          when Emotion.icons[:smile]
            scope.smile
          else
           scope
        end
    end

    @emotions = scope.order(created_at: :desc)
  end

  def show
  end

  def destroy
    @emotion.destroy
    redirect_to action: :index, status: :see_other
  end

  def like
    @emotion.like_countup!
    redirect_to @emotion
  end

  private

  def find_emotion
    @emotion = Emotion.find(params[:id])
  end

  def emotion_params
    params.require(:emotion).permit([:icon, :name, :body])
  end
end
