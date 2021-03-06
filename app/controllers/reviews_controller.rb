class ReviewsController < ApplicationController
	before_filter :load_product
	before_filter :ensure_logged_in, :only => [:show]

  def show
  	@review = Review.find(params[:id])
  end

  def create
  	@review = @product.reviews.build(review_params)
  	@review.user_id = current_user.id

  	if @review.save
  		render 'products/show', notice: 'Review created successfully'
 	 else
      flash.now[:alert] = "Your comment failed to be created."
  		render 'products/show'
 	 end
	end

  def destroy
  	@review = Review.find(params[:id])
  	@review.destroy
  end

  private
  def review_params
  	params.require(:review).permit(:comment, :product_id)
  end

  def load_product
  	@product = Product.find(params[:product_id])
  end 

end
