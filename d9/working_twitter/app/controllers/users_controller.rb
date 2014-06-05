class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    @user.save

    redirect_to "/"
  end

  def new
    @new_user = User.new
  end

  def update
  end

  def edit
  end

  def delete
  end

  private 

    def user_params
      params.require(:user).permit(:handle, :bio, :email)
    end
end
