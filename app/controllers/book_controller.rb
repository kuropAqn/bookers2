class BookController < ApplicationController
  def index
    @Books = Book.all
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @book = Book.new
    @book.user_id = current_user.id
    @book.save
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.edit
    redirect_to
  end

  def destroy
    @book = Book.find(params[:id])
    @book = .destroy
    redirect_to book_index_path
  end

end
