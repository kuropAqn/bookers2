class BookController < ApplicationController
  def index
    @Books = Book.all
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @book = Book.new
    @book.save
  end

  def edit
  end

  def update
    @book = Book.find(params[:id])
    @book.edit
    redirect_to 
  end

  def destroy
  end

end
