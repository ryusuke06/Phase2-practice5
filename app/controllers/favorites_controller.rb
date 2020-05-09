class FavoritesController < ApplicationController

	def create
		book = Book.find(params[:book_id])
        favorite = current_user.favorites.new(book_id: book.id)#引数？book.idとbook_idがイコールか見てる？
        favorite.save
        redirect_back(fallback_location: root_path)
	end

	def destroy
		book = Book.find(params[:book_id])
        favorite = current_user.favorites.find_by(book_id: book.id)
        favorite.destroy
        redirect_back(fallback_location: root_path)
    end

end
