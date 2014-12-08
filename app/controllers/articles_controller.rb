class ArticlesController < ApplicationController
 before_action :set_breaking_news, :only => [:show,:category]
 before_action :carousel_articles, :only => :index

  def show
  	@article=Article.find(params[:id])

    @category=@article.category

  end

  def new
    if is_signed_in?

  	   @article=current_user.articles.new

      4.times do
        @article.photos.build
      end

    else
      
      redirect_to root_path
    end

  end

  def index

    @articles=Article.all.order(created_at: :desc).paginate(:page => params[:page], :per_page => 3)
    @carousel_article=Article.all.order(created_at: :desc).limit(3)
    #@carousel_article=Article.all.order(created_at: :desc).paginate(:page => params[:page], :per_page => 3)
    @user=current_user
  end

  def edit
    @article=current_user.articles.find(params[:id])
  end

  def update
    @article=current_user.articles.find(params[:id])
    
      if @article.update(article_params)
        redirect_to article_path(@article)
      else
        render :edit
      end
  end

  def create

    @article = current_user.articles.new( article_params)
    #@article.user_id = session[:user_id]
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
    @category_articles= Article.all.where(:category => params[:category]).recent
  end

  private

  def article_params
  	params.require(:article).permit(:title,:author,:content,:category, photos_attributes: [:name, :id, :image, :_destroy])

  end

  def carousel_articles
     @carousel_article=Article.all.order(created_at: :desc).limit(3)
   end

  def set_breaking_news
    @breaking_articles = Article.all.order('created_at desc').limit(5);
   
    #@category=params[:category]
  end
end