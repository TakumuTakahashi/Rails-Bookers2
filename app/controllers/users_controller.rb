class UsersController < ApplicationController
  #ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_user!
  
  def index
    @users = User.all
    @user = User.find(current_user.id)
    @book = @user.books.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books.all
    @book = @user.books.new
  end

  def edit
    @user = User.find(params[:id])
    if current_user.id != @user.id
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'You have updated user successfully.'
    redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
end
