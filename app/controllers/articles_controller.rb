class ArticlesController < ApplicationController
	before_action :set_article, only: [:show, :edit, :update, :destroy]
	def index
		@articles=Article.all
	end
	
	def new
		@article=Article.new
	end

	def create
		@article=Article.new(article_params)
		if @article.save
			flash[:success] = "Successfully created"
			redirect_to @article
		else
			render 'new'
		end
	end

	def show
	end

	def edit
	end

	def update
			if @article.update(article_params)
				flash[:success] = "Successfully updated"
				redirect_to @article
			else
				render 'edit'
			end
	end

	def destroy
		@article.destroy
		flash[:notice]= "Sucessfully deleted article with title: #{@article.title}"
		redirect_to articles_path
	end

	private
	def article_params
		params.require(:article).permit(:title, :body)
	end
	
	def set_article
      @article = Article.find(params[:id])
    end
end
