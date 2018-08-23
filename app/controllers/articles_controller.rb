class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      p 'article saved!'
      redirect_to @article
    else
      p 'Article rejected for errors'
      p @article.errors.messages
      render 'new'
  end

    def edit; end

    def show; end

    def index
      @articles = Article.all
    end
end

  private

  def article_params
    params.require(:article).permit(:title, :author, :content)
  end
end
