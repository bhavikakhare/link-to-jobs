class ReviewsController < ApplicationController
    before_action :authenticate_user!
    before_action :is_applicant
    before_action :require_permission, except: [:create]

    def is_applicant
        if current_user.is_recruiter
            redirect_to job_postings_url, flash: { error: "You do not have permission to do that." }
        end
    end

    def require_permission
        if current_user != Review.find(params[:id]).applicant
            redirect_to company_url(@company), flash: { error: "You do not have permission to do that." }
        end
    end

    def create
        @company = Company.find(params[:id])
        @review = Review.new(params.require(:review).permit(:rating_5, :review_text, :anonymous, :user_id, :company_id))
        if @review.save
            @count_ratings = @company.count_ratings + 1
            @sum_ratings = @company.sum_ratings + @review.rating_5
            @company.update(count_ratings: @count_ratings)
            @company.update(sum_ratings: @sum_ratings)
            @avg_rating = (@company.sum_ratings / @company.count_ratings).round(1)
            @company.update(avg_rating: @avg_rating)
            flash[:success] = 'Review was successfully submitted'
            redirect_to company_url(@company)
        else
            flash.now[:error] = "Please check the errors below and try again"
            render 'companies/show'
        end
    end

    def edit
        @review = Review.find(params[:id])
        render :edit
    end

    def update
        @review = Review.find(params[:id])
        @company = @review.company
        @old_sum = @review.rating_5
        if @review.update(params.require(:review).permit(:rating_5, :review_text, :anonymous, :user_id, :company_id))
            @sum_ratings = @company.sum_ratings - @old_sum + @review.rating_5
            @company.update(sum_ratings: @sum_ratings)
            @avg_rating = (@company.sum_ratings / @company.count_ratings).round(1)   
            @company.update(avg_rating: @avg_rating)
            flash[:success] = 'Review was successfully submitted'
            redirect_to company_url(@review.company)
        else
            flash.now[:error] = "Please check the errors below and try again"
            render 'companies/show'
        end 
    end

    def destroy
        @review = Review.find(params[:id])
        @company = @review.company
        @review.destroy
        @count_ratings = @company.count_ratings - 1
        @sum_ratings = @company.sum_ratings - @review.rating_5
        @company.update(count_ratings: @count_ratings)
        @company.update(sum_ratings: @sum_ratings)
        @avg_rating = (@company.sum_ratings / @company.count_ratings).round(1)   
        @company.update(avg_rating: @avg_rating)
        flash[:success] = 'Review was successfully destroyed.'
        redirect_to company_url(@review.company)
    end
end
