class Admin::CategoriesController < ApplicationController

    def index
        @categories = Category.all.order(created_at: :desc)
    end
    
    def new
        @category = Category.new
    end
    
    def create
        @category = Category.new(category_params)
        
        if @category.save
            redirect_to @category
          else
            # This line overrides the default rendering behavior, which
            # would have been to render the "create" view.
            render "new"
          end

    end
  private
  def category_params
    params.require(:category).permit(:name)
  end
end
