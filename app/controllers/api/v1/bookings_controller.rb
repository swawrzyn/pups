class Api::V1::BookingsController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token
  def new
    @pup = Pup.find(params[:pup_id])
    @booking = Booking.new(booking_params)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @pup = Pup.find(params[:pup_id])
    @booking = Booking.new(booking_params)
    @booking.pup = @pup

    if @booking.save
      render :show, status: :created
    else
      render_error
    end
  end

  def update
    @booking = Booking.find(params[:id])
    if (@booking.update booking_params)
      render :show, status: :created
    else
      render_error
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
  end


  private

  def booking_params
    params.require(:booking).permit(:pup_id, :user_id, :time_start, :time_end, :accepted)
  end

  def render_error
    render json: { error: @booking.errors.full_messages },
      status: :unprocessable_entity
  end

end
