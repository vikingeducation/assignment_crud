class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(whitelist_article_params)

    if @article.save
      flash[:Success] = "Great! Your post has been created!"
      redirect_to article_path(@article.id)
    else
      render :new
    end

  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.new(whitelist_article_params)

    if @article.update(whitelist_article_params)
       flash[:Success] = "Great! Your post has been updated!"
      redirect_to article_path(@article.id)
    else
      render :edit
    end
  end
  

  def destroy
    @article = Article.find(params[:id])

    if @article.destroy
      flash[:Success] = "Great! Your post has been deleted."
      redirect_to root_path
    else
      redirect_to :back
    end

  end

  private

  def whitelist_article_params
    params.require(:article).permit(:title, :body)
  end


end



