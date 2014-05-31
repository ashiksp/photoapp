class CommentsController < ApplicationController

	def new_comment
		@comments = Comment.all
		@comment = Comment.new		
	end

	def create
		@comment = Comment.new(comment_params)
		if @comment.save
  			flash[:success] = "Comment posted successfully"
  			render 'albums/comment_modal'
  		else
  			render 'albums/comment_modal'
  		end
	end

	def destroy
		
	end

	private

	def comment_params
		params.require(:comment).permit(:content)
	end

end
