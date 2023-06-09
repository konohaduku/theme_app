class BooksController < ApplicationController
  def new
    @book=Book.new
  end

    def create
    book = Book.new(book_params)
    if book.save
    redirect_to book_path(book.id)
    else
    @books= Book.all
    @book = Book.new(book_params)
    if @book.save
    redirect_to book_path(book.id)
    else
      render :index
      end
    end
    flash[:notice] = "Book was successfully created."
    end
    

  def index
    @books = Book.all
    @book=Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
  @book = Book.find(params[:id])
  end

   def update
    book = Book.find(params[:id])
    book.update(book_params)
     @book = Book.new(book_params)
    if @book.save
    flash[:alert] = "Book was successfully updated."
    redirect_to book_path(book.id)
    else
    render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

   private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
