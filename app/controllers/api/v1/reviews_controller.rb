class Api::V1::ReviewsController < Api::V1::BaseController
  before_action :load_pup

  def index
    @review = Review.all
  end

  def create
    @review = Review.new(review_params)
    if (@review.save)
      render :show, notice: 'Your review is deleted'
    else
      render_error
    end
  end

  private

  def load_pup
    @pup = Pup.find(params[:pup_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating, :user, :booking)
  end

  def render_error
    render json: { error: @review.errors.full_messages },
    status: :unprocessable_entity
  end
end
