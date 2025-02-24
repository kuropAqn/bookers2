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
    @book = Book.new(book_params)  # book_paramsは許可した属性を取得するためのメソッド
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id) # 保存後、追加された本の詳細ページにリダイレクト
    else
      @books = Book.all
      render :new  # 保存に失敗した場合は新規作成ページを再表示
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
  def book_params
    params.require(:book).permit(:title, :body)  # titleとbodyのみを許可
  end

end
