class ArticlesController < ApplicationController
  before_action :login_user

  def index
    @user = current_user
    @articles = @user.articles.all
  end

  def show
    @user = User.find(params[:user_id])
    @article = Article.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @article = Article.new
  end

  def create
    @user = User.find(params[:user_id])
    @article = @user.articles.new(article_params)
    if @article.save
      redirect_to user_article_path(@user, @article)
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @article = Article.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @article = @user.articles.find(params[:id])
    if @article.update!(edit_article_params)
      redirect_to user_article_path(@user, @article)
    else
      render :edit
    end
  end

  def destroy
    @user = current_user
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to user_articles_path(@user)
  end

  private
    def article_params
      params.require(:user).permit(articles: [:title, :content, :img])[:articles]
    end

    def edit_article_params
      params.require(:article).permit(:title, :content, :img)
    end

    def login_user
      redirect_to new_user_session_path if current_user.nil?
    end
end
