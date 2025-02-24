class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.new
    @books = Book.all
  end

  def create
    @book = Book.new
    if @book.save
      flash[:notice] = "Book was successfully created."
    else
      @books = Book.all
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(books_params)
    redirect_to book_path
    flash[:notice] = "Book was successfully updated."
    else 
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book = Book.destroy
    flash[:notice] = "Book was successfully destroyed."
  end

  private
  def books_params
    params.require(:books).permit(:title, :body, :image)
  end

end
