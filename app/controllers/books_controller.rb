class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def index
      @book_new = Book.new
      @books = Book.all
      @user = current_user
  end 
  
  def create
      @book_new = Book.new
      @book = Book.new(book_params)
      @book.user_id = current_user.id
      if @book.save
        flash[:notice]="Your request is successfully."
        redirect_to book_path(@book)
      else
        @books =Book.all
        @user = current_user  
        render :index
      end   
  end   

  def show
      @book_new = Book.new
      @book = Book.find(params[:id])
      @user = @book.user
  end   

  def edit
      @book = Book.find(params[:id])
      flash[:notice]="Your request is successfully."
  end   

  def update
      @book = Book.find(params[:id])
      @book.user_id = current_user.id
      if @book.update(book_params)
          flash[:notice]="Your request is successfully."
          redirect_to book_path(@book.id)
      else
          render :edit
      end  
  end   

  def destroy
      book = Book.find(params[:id])
      book.destroy
      flash[:notice]="Your request is successfully."
      redirect_to books_path
  end  

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def is_matching_login_user
      book = Book.find(params[:id])
      unless book.user.id == current_user.id
        redirect_to books_path
      end
  end

end