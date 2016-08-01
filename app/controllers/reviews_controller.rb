class ReviewsController < ApplicationController
  before_action :find_user

  def new
    @review = @user.reviews.build
  end

  def create
    @review = @user.reviews.build(review_params)
    @review.completed = true

    if @review.save
      redirect_to @user
    else
      render :new, alert: "Review failed"
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :review, :completed)
  end

  def find_user
    @user = User.find(params[:user_id])
  end

end
