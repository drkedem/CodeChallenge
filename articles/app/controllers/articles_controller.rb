class ArticlesController < ApplicationController

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
      render nothing: true, status: :bad_request
    end
  end
  
  def update
    find_article
    if @article.update(article_params)
      render json: @article
    else
      render nothing: true, status: :bad_request
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
     render nothing: true, status: :not_found unless @article.present?
   end
end
