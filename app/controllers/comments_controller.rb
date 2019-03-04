class CommentsController < ApplicationController
	def new
		@article= Article.find(params[:article_id])
		@comment = @article.comments.build
	end
	
	def create
		@article= Article.find(params[:article_id])
		@comment= @article.comments.create(comment_params)
		if @comment.save
			flash[:notice]="sucessfuly created comment"
			redirect_to article_path(@article)
		else
			flash[:alert]="not created"
			render 'new'
		end
	end

	def show
		@comment= Comment.find(params[:id])
	end
	def edit
		@comment= Comment.find(params[:id])
	end

	def update
		@comment= Comment.find(params[:id])
		if @comment.update(comment_params)
			flash[:sucess]= "sucessfuly updated!"
			redirect_to article_path(@comment.article_id)
		else
			flash[:alert]="not updated!"
			render 'edit'
		end
	end
	
	def destroy
		@comment= Comment.find(params[:id])
		@comment.destroy	
		redirect_to article_path(@comment.article_id)
	end
	private
	def comment_params
		params.require(:comment).permit(:commenter, :body)
	end
end
