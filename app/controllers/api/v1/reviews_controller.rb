class Api::V1::ReviewsController < Api::V1::BaseController



  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    @review.booking = @booking
    if (@review.save)
      redirect_to api_v1_booking_path(@review.booking)
    else
      render_error
    end
  end


  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def render_error
    render json: { error: @review.errors.full_messages },
      status: :unprocessable_entity
  end
end
