class UsersController < ApplicationController
  def index
    @user = User.new
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(book_params)
      redirect_to 
    else
      render :users_edit_path
    end
  end

end
