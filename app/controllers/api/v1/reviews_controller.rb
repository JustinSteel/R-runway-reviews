class Api::V1::ReviewsController < ApplicationController
  before_action :set_review, only: %i[ show update destroy ]
  before_action :get_user, only: %i[ index show create destroy ]

  # GET /reviews
  def index
    @user = User.find(params[:user_id])
      if params[:user_id].present?
        @ureviews = @user.reviews
        render ReviewSerializer.new(@ureviews)
      else
        @reviews = Review.all
        render ReviewSerializer.new(@reviews)
      end

  end

  # GET /api/v1/users/:user_id/reviews/:id
  def show
    render ReviewSerializer.new(@review)
  end

  # POST /api/v1/users/:user_id/reviews
  def create
    @review = Review.new(review_params)

    if @review.save
      render ReviewSerializer.new(@review), status: :created, location: @review
    else
      render ErrorSerializer.new(@review.errors), status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reviews/1
  def update
    if @review.update(review_params)
      render json: @review
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/users/:user_id/reviews/:id
  def destroy
    @review.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    def get_user
      @user = User.find(params[:user_id])
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:user_id, :airport_id, :comment, :category)
    end
end
