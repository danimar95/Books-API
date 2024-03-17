class BooksController < ApplicationController
  def index
    if params[:author_id]
      @books = Author.find_by_id(params[:author_id]).books
      render json: @books
    else
      @books = Book.all
      render json: @books
    end
  end

  def show
    @book = Book.find(params[:id])
    render json: @book
  end

  def create
    @author = Author.find(params[:author_id])
    @book = @author.books.create(title: params[:title])
    render json: @book
  end

  def update
    if params[:author_id]
      @book = Author.find_by_id(params[:author_id]).books.find(params[:id])
      @book.update(title: params[:title])
      render json: @book
    end
  end

  def destroy
    @book = Author.find_by_id(params[:author_id]).books.find(params[:id])
    @book.destroy
    render json: {}
  end
end
