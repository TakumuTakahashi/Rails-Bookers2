class BooksController < ApplicationController
  #ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_user!
  
  def index
    @user = User.find(current_user.id)
    @books = Book.all
    @book = current_user.books.new
  end

  def create
    @book = current_user.books.new(book_params)
    if @book.save
      flash[:notice] = 'You have creatad book successfully.'
      redirect_to book_path(@book)
    else
      @user = User.find(current_user.id)
      @books = Book.all 
      render :index
    end
  end
  
  def show
    @detail_book = Book.find(params[:id])
    @book = current_user.books.new
    @user = User.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = 'You have updated book successfully.'
      redirect_to book_path(@book)
    else
      render :edit
    end
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
