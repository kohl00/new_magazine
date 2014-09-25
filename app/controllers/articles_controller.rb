class ArticlesController < ApplicationController
 before_action :set_breaking_news, :only => [:show,:category]

  def show
  	@article=Article.find(params[:id])

    @category=@article.category

  end

  def new
  	@article=Article.new

    4.times do
      @article.photos.build
    end
  end

  def index

    @articles=Article.all.order(created_at: :desc).paginate(:page => params[:page], :per_page => 3)
  end

  def edit
    @article=Article.find(params[:id])
  end

  def update
    @article=Article.find(params[:id])
      if @article.update(article_params)
        redirect_to article_path(@article)
      else
        render :edit
      end
  end

  def create
    @article=Article.create(article_params)
    @article.user_id = session[:user_id]
    if @article.save
        flash[:success] = "You have successfully created an article."
        redirect_to article_path(@article)
    else
      render :new
    end
  end

  def destroy
    @article=Article.find(params[:id]).destroy
    redirect_to root_path
  end

  def category
    @category= params[:category] 
    @category_articles= Article.all.where(:category => params[:category]).order(created_at: :desc).limit(6)
  end

  private

  def article_params
  	params.require(:article).permit(:title,:author,:content,:category, photos_attributes: [:name, :id])
  end

  def set_breaking_news
    @breaking_articles = Article.all.order('created_at desc').limit(5);
   
    #@category=params[:category]
  end
end