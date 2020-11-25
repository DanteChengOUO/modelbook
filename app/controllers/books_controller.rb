class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path, notice: "新增成功囉"
    else
      render new_book_path
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destory
  end

  def book_params
    params.require(:book).permit(:title)
  end
end
