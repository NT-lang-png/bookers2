class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    #条件分岐
    unless @user.id == current_user.id
      redirect_to user_show_path(current_user.id)
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] ="You have updated user successfully."
      redirect_to user_show_path(current_user.id)
    else
      render :edit
    end
  end

  def index
    @users = User.all
    @book = Book.new
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end
  

end
