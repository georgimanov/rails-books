class BooksController < ApplicationController

  def index
    sort = params[:sort] #|| session[:sort]

    case sort
      when 'title'
        ordering,@title_header = {:title => :asc}, 'hilite'
      when 'publish_date'
        ordering,@date_header = {:publish_date => :asc}, 'hilite'
    end

    @all_genres = Book.all_genres
    @selected_genres = params[:genres] || {} #begin|| session[:genres] || {}
    if @selected_genres == {}
      @selected_genres = Hash[@all_genres.map{|genre| [genre, genre]}]
    # end

    # if params[:sort] != session[:sort] or params[:genres] != session[:genres]
    # session[:sort] = sort
    # redirect_to :sort => sort, :genres => @selected_genres and return
    end

    @books = Book.where(genre: @selected_genres.keys).order(ordering)

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
    permitted = params[:book].permit(:title,:genre,:publish_date,:isbn_number,:description,:author)
    @book = Book.new(permitted)
    if @book.save
      flash[:notice] = "#{@book.title} was successfully created."
      redirect_to books_path
    else
      render 'new'
    end

  end

  def edit
    @book = Book.find params[:id]
  end

  def update
    @book = Book.find params[:id]
    params.require(:book)
    permitted = params[:book].permit(:title,:genre,:publish_date,:isbn_number,:description,:author)
    if @book.update_attributes  (permitted)
      flash[:notice] = "#{@book.title} was successfully updated."
      redirect_to book_path(@book)
    else
      render 'edit'
    end

  end

  def destroy
    @book = Book.find params[:id]
    @book.destroy
    flash[:notice] = "Book '#{@book.title}' deleted."
    redirect_to books_path
  end

end