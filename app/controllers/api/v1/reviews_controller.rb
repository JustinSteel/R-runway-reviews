class Api::V1::ReviewsController < ApplicationController
  before_action :set_review, only: %i[ show update destroy ]
  before_action :get_user, only: %i[ show create destroy ]

  # GET /api/v1/reviews
  def index
    @reviews = Review.all
    render json: ReviewSerializer.new(@reviews)
  end

  # GET /api/v1/users/:user_id/reviews/:id
  def show
    render json: ReviewSerializer.new(@review)
  end

  # POST /api/v1/users/:user_id/reviews
  def create
    @review = Review.new(review_params)

    if @review.save
      render json: ReviewSerializer.new(@review), status: :created
    else
      render json: ErrorSerializer.new(@review.errors), status: :unprocessable_entity
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
    render json: { message: "Review deleted" }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    def get_user
      if params[:user_id].present?
        @user = User.find_by(id: params[:user_id])
      elsif params[:data].present? && params[:data].is_a?(Array)
        user_id = params[:data].dig(0, :attributes, :user_id)
        @user = User.find_by(id: user_id) if user_id.present?
      end
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:user_id, :airport_id, :comment, :category)
    end
end
