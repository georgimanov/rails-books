class BooksController < ApplicationController

  def index
    sort = params[:sort]

    case sort
    when 'title'
      ordering,@title_header = {:title => :asc}, 'hilite'
    when 'publish_date'
      ordering,@date_header = {:publish_date => :asc}, 'hilite'
    end

    @books = Book.order(ordering)
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

  def edit
    @book = Book.find params[:id]
  end

  def update
    @book = Book.find params[:id]
    params.require(:book)
    permitted = params[:book].permit(:title,:genre,:publish_date,:isbn_number,:description)
    @book.update_attributes!(permitted)
    flash[:notice] = "#{@book.title} was successfully updated."
    redirect_to book_path(@book)
  end

  def destroy
    @book = Book.find params[:id]
    @book.destroy
    flash[:notice] = "Book '#{@book.title}' deleted."
    redirect_to books_path
  end

end