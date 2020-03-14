class UsersController < ApplicationController
	before_action :authenticate_user!
  def index
  	@users = User.all
  	@book = Book.new
  	@user = current_user
  end

  def edit
  	@user = User.find(params[:id])
  	@book = Book.new
      if current_user != @user
        redirect_to user_path(current_user)
      end

  end

  def show
  	@user = User.find(params[:id])
  	@book = Book.new
  	@books = @user.books
    name = User.find(params[:id])
  end
  def update
  	@user = User.find(params[:id])
        @user.update(user_params)

        if @user.save
          flash[:notice] = "You have updated user successfully."
          redirect_to user_path(@user)
           else
          render :edit
        end
  end
  private
    def user_params
        params.require(:user).permit(:name, :introduction, :profile_image)
    end
end
