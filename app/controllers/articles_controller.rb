class ArticlesController < ApplicationController
  def show
  	@article=Article.find(params[:id])

  	@breaking_articles=Article.all.order(created_at: :desc)
  	
  end

  def new
  	@article=Article.new
  end

  def index
  end

  def edit
  end

def create
	@article=Article.create(article_params)
		redirect_to article_path(@article)
end

private

def article_params
	params.require(:article).permit(:title,:author,:content,:category)
end

end