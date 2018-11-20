class Api::V1::BookingsController < Api::V1::BaseController


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
      render :error
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
  end


  private

  def booking_params
    params.require(:booking).permit(:pup_id, :user_id, :time_start, :time_end)
  end

  def render_error
    render json: { error: @booking.errors.full_messages },
      status: :unprocessable_entity
  end

end
