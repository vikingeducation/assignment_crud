class ArticlesController < ApplicationController


  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(whitelisted_params)
    if @article.save
      flash[:success] = "You just created #{@article.title}"
      redirect_to article_path(@article)
    else
      flash.now[:error] = "Sorry, save wasn't successful"
      render 'new' 
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(whitelisted_params)
      flash[:succes] = "You updated #{@article.title}"
      redirect_to article_path(@article)
    else
      flash.now[:error] = "Sorry, update wasn't successful"
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:success] = "You deleted #{@article.title}"
    redirect_to articles_path
  end

  private

  def whitelisted_params
    params.require(:article).permit(:title, :body)
  end
end
