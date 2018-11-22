class Api::V1::UsersController < Api::V1::BaseController




  def show
    @user = User.find(params[:id])
    p "Found user for params #{params}: #{@user}"
  end

end
