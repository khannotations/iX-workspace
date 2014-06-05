class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User #{@user.handle} successfully created"
      redirect_to "/"
    else
      flash[:error] = @user.errors.full_messages[0]
      render "new"
    end
  end

  def new
    @user = User.new
  end

  def update
    @user = User.last
    @user.update_attributes(user_params)
    flash[:success] = "Update successful!"
    redirect_to "/profile"
  end

  def profile
    @user = User.last # The signed in user
  end

  def edit
    @user = User.last
  end

  def delete
  end

  private 

    def user_params
      params.require(:user).permit(:handle, :bio, :email)
    end
end
