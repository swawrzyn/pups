class Api::V1::PupsController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token

  def index
    @pups = Pup.all
  end

  def show
    @pup = Pup.find(params[:id])
  end

  def update
    @pup = Pup.find(params[:id])
    if @pup.update pup_params
      render :show, status: :created
    else
      render_error
    end
  end

  def create
    @pup = Pup.new(pup_params)
    if @pup.save
      render :show, status: :created
    else
      render_error
    end
  end

  def destroy
    @pup = Pup.find(params[:id])
    @pup.destroy
  end

  private

  def pup_params
    params.require(:pup).permit(:user_id, :name, :location, :description, :price, :images => [])
  end

  def render_error
    render json: { error: @pup.errors.full_messages },
      status: :unprocessable_entity
  end
end
