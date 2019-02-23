class ReviewsController < ApplicationController
    
    def create
        @product = Product.find params[:product_id]
        @review = @product.reviews.create(review_params)

        @review.user = current_user

        if @review.save!
            redirect_to @product, notice: 'Review is  submitted'
        else
            redirect_to @product, notice: "An error occured"
        end

    
    end
    def destroy
        @review = Review.find params[:id]
        @review.destroy!
        redirect_to product_path(@review.product_id)
    end

    private 
    def review_params
        params.require(:review).permit(:description ,:rating, :user_id)
    end
end
