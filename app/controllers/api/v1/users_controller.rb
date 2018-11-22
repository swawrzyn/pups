class Api::V1::UsersController < Api::V1::BaseController
  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render :show, status: :updated
    else
      render_error
    end
  end

  private

  def user_params
    params.require(:user).permit(:avatarUrl, :nickName)
  end

  def render_error
    render json: { error: @user.errors.full_messages },
           status: :unprocessable_entity
  end
end
