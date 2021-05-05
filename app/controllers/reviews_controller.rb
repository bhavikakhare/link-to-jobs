class ReviewsController < ApplicationController

    def create
        @company = Company.find(params[:id])
        @review = Review.new(params.require(:review).permit(:rating_5, :review_text, :applicant_id, :company_id))
        if @review.save
            flash[:success] = 'Review was successfully submitted'
            redirect_to company_url(@company)
        else
            flash.now[:error] = "Please check the errors below and try again"
            render 'companies/show'
        end
    end

    def update

    end

    def destroy

    end
end
