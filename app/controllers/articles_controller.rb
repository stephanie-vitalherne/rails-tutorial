class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
  end

  def edit; end

  def show; end

  def index; end
end
private
  def article_params
    params.require(:article).permit(:title, :author, :content)
  end
end
