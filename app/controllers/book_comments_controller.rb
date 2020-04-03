class BookCommentsController < ApplicationController
	def create
		book1=Book.find(params[:book_id])
		comment1=BookComment.new(book_comment_params)
		comment1.user_id=current_user.id
		comment1.book_id=book1.id
		if comment1.save
		redirect_to book_path(book1.id)
	   else
		redirect_to book_path(book1.id)

	    end
	end
	def destroy
		book1=Book.find(params[:book_id])
	    comment=BookComment.find_by(book_id: params[:book_id])
	    comment.destroy
  	    redirect_to  book_path(book1.id), notice: "successfully delete comment!"
	end
	private
	def book_comment_params
		params.require(:book_comment).permit(:comment)
    end
end
