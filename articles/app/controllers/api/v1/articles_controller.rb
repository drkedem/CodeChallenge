class Api::V1::ArticlesController < ApplicationController

  def index
    @articles = Article.all
    render json: @articles
  end

  def show
    find_article
    render json: @article
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      render json: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def update
    find_article
    if @article.update(article_params)
      render json: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def destroy
    find_article
    @article.destroy
  end

  private
  def article_params
    params.require(:article).permit(:title, :description, :author, :tags)
  end

  def find_article
    @article = Article.find(params[:id])
    render json: true, status: :not_found unless @article.present?
  end
end
