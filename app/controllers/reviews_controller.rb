class ReviewsController < ApplicationController
    before_filter :logged_in?
    
    def logged_in?
        if !current_user
        flash[:error] = "you must be logged in to review an item"
        redirect_to login_path
        end
    end

    def create
        @review = Review.new review_params
        if @review.save
           redirect_to "/products/#{@review.product_id}", notice: 'Review created!'
        else
        redirect_to "/products/#{@review.product_id}", notice: 'Review not saved!'
        end
    end

    def destroy
        @product = Product.find(params[:product_id])
        @review  = Review.find(params[:id])
        @review.destroy
    
        redirect_to product_path @product
      end

    private
    def review_params
        params["review"]["product_id"] = params["product_id"]
        params["review"]["user_id"] = current_user.id
        puts params["review"]
          params.require(:review).permit(
          :product_id,
          :user_id,
          :rating,
          :description
        )
    end

end
