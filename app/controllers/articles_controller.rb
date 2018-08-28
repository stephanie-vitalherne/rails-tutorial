class ArticlesController < ApplicationController
  before_action :find_article, only: %i[show edit update]
  def new
    @article = Article.new
  end

  def create
    # POST /articles
    @article = Article.new(article_params)
    @article.user_id = 2
    if @article.save
      p 'article saved!'
      redirect_to @article
    else
      p 'Article rejected for errors'
      p @article.errors.messages
      render 'new'
  end
end

  def edit; end

  def update
    if @article.update(article_params)
      p 'Article successfully updated'
      redirect_to @article
    else
      render 'edit'
    end
  end

  def show; end

  def index
    # GET /articles
    @articles = Article.all.order('CREATED_AT DESC')
  end

  def search; end

  def results
    @results = params[:q]
    search_words = params[:q].split(' ')
    titles = Article.pluck(:title)
    matches = []
    @final_results = []
    search_words.each do |word|
      titles.each do |t|
        matches << t if t.include?(word)
      end
    end
    matches.each do |match|
      Article.all.each do |_article|
        x = Article.where(title: match)
        @final_results << x
      end
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :author, :content, :cover_photo)
  end

  def find_article
    @article = Article.find(params[:id])
  end
end
