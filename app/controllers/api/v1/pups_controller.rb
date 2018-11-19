class Api::V1::PupsController < Api::V1::BaseController
  def index
    @pups = Pup.all
  end

  def show
    @pup = Pup.find(params[:id])
  end


end
