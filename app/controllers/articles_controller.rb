class ArticlesController < ApplicationController
    def index
        @article = Article.all
    end
    
    def show
        @article = Article.find(params[:id])
    end
    
    def new
        @article = Article.new
    end
    
    def create
    #   render plain: params[:article][:title].inspect
        @article = Article.new(article_params)

        if @article.save
            redirect_to @article
        else
            render 'new'  
        end
    end

    private
    def article_params
        params.require(:article).permit(:title,:text)
    end
end
