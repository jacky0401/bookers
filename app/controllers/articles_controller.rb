class ArticlesController < ApplicationController
    def index
   	    @articles = Article.all
   	    @id = params[:id]
    end

	def show
		@article = Article.find params[:id]
	end
	
	def create
		@article = Article.new(article_params)
		if @article.save
			flash[:notice] = "Book was successfully created."
		    redirect_to article_path(@article)
	    else
	    	render("articles/index")
	    end
	end

	def edit
		@article = Article.find params[:id]
	end

	def update
		@article = Article.find params[:id]
		if @article.update(article_params)
		   flash[:notice] = "Book was successfully updated."
		   redirect_to @article
		end
	end

	def destroy
		@article = Article.find params[:id]
		@article.destroy
		redirect_to articles_path
	end                   

	private
	def article_params
		params.require(:article).permit(:title, :text)
	end
end