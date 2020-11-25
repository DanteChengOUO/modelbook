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
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to books_path, notice: "更新成功囉"
    else
      render edit_book_path, notice: "更新失敗囉"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path notice:"刪除成功囉"
  end

  def book_params
    params.require(:book).permit(:title)
  end
end
