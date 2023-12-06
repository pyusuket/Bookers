class BooksController < ApplicationController
  def new
    @book = Book.new
    @books = Book.all
  end
  def create
    @book = book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :new   
    end
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])  
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :edit
    end
  end
  
  def destroy
    book = Book.find(params[:id])  
    book.destroy  
    redirect_to '/books/new'  
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
