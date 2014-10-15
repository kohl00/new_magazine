class StaticController < ApplicationController
  def index
  end
  
  def category
  end

  def article
  end

  def edit
    
  end

  def subscribe
  end

  def profile
    @my_articles = Article.all.order('created_at desc').where(:user_id => current_user).limit(5);
    @user= current_user
    
  end

  private

  def user_params
    params.require(:user).permit(:first_name,:last_name,:email,:bio,:avatar)
  end
end
