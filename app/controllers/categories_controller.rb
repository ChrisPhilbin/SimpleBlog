class CategoriesController < ApplicationController
    
    before_action :logged_in?, only: [:create]
    
    def index
        @category = Category.all
    end
    
    def create
        @category = Category.new(category_params)
        @category.save
    end
    
    def show
       @category = Category.find_by(category_params) 
    end
    
private    
    
    def category_params
        params.require(:category).permit(:topic)
    end
    
end
