class ReviewsController < ApplicationController
	before_action :find_movie
	
	def new
		@movie = Movie.find(params[:movie_id])
		@review = Review.new
	end

	def create
		@review = Review.new(review_params)
		@review.movie_id = @movie_id
		@review.user_id = current_user.movie_id

		if @review.save
			redirect_to movie_path(@movie)
		else
			render 'new'
		end
	end

	private

	def review_params
		params.require(:review.permit(:rating, :comment)
	end

	def find_movie
		@movie = Movie.find(params[:movie_id])
	end
end
