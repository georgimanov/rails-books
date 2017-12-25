class BooksController < ApplicationController
  def index
    @books = Book.all
  end
  def show
    id = params[:id]
    @book = Book.find(id)
  end
  def new
    @book = Book.new
  end
  def create
   params.require(:book)
   permitted = params[:book].permit(:title,:genre,:publish_date,:isbn_number,:description)
   @book = Book.create!(permitted)
   flash[:notice] = "#{@book.title} was successfully created."
   redirect_to books_path
  end
end