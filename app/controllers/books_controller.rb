class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]
	def index
  	@books = Book.all
  	@user = current_user
  	@book = Book.new
  	@users = @book.user

    end
    def new
    	@book = Book.new
    end
    def create
    	@book = Book.new(book_params)
    	@books = Book.all
	  	@user = current_user
	  	@users = @book.user
    	@book.user_id = current_user.id
    	if @book.save
          flash[:notice] = "You have creatad book successfully."
           redirect_to book_path(@book)
           else
          render :index
        end
    end

    def edit
        @book = Book.find(params[:id])

    end

    def update
        @book = Book.find(params[:id])
        @book.update(book_params)
        if @book.save
          flash[:notice] = "You have creatad book successfully."
          redirect_to book_path(@book)
           else
          render :edit
        end
    end
    def show
    	@book = Book.find(params[:id])
    	@user = @book.user
  	    @newbook = Book.new

    end


  	def destroy
  		 book = Book.find(params[:id]) #データ(レコード)を1件取得
         book.destroy #データ（レコード）を削除
         redirect_to books_path #List一覧画面へリダイレクト

    end
    private
    def correct_user
        @book = Book.find(params[:id])
         if @book.user != current_user
          redirect_to books_path
         end
    end
    def book_params
        params.require(:book).permit(:title, :body)
    end



end
