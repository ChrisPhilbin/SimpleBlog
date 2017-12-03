class ArticlesController < ApplicationController
    
    before_action :logged_in?, only: [:edit, :update, :destroy, :create]

    def index
        if Article.count >= 1
            @article = Article.all.paginate(page: params[:page], per_page: 3)
        else
            flash[:danger] = "There are no blog posts to display!"
            redirect_to root_url
        end
    end
    
    def show
        @article = Article.find_by_slug(params[:slug])
    end       
    
    def edit
        @article = Article.find_by_slug(params[:slug])
    end
    
    def update
        @article = Article.find_by_slug(params[:slug])
        if
            @article.update_attributes(article_params)
            redirect_to root_url
        else
            render 'articles/edit'
        end
    end
    
    def destroy
        Article.find_by_slug(params[:slug]).destroy
        redirect_to request.referrer || root_url
    end
    
    def create
        @article = Article.new(article_params)
        if @article.save
            flash[:success] = "Article saved!"
            redirect_to root_url
        else
            flash[:danger] = "Article not saved!"
            redirect_to root_url
        end
    end
    
    private
    
    def article_params
        params.require(:article).permit(:title, :body, :topic, :slug)
    end
    
end
