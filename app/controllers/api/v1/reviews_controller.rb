class Api::V1::ReviewsController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token

  def create
    @review = Review.new(review_params)
    if (@review.save)
      redirect_to api_v1_booking_path(@review.booking)
    else
      render_error
    end
  end


  private

  def review_params
    params.require(:review).permit(:content, :rating, :user_id, :booking_id)
  end

  def render_error
    render json: { error: @review.errors.full_messages },
      status: :unprocessable_entity
  end
end
