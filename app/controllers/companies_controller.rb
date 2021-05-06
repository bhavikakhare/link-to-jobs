class CompaniesController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :is_recruiter, except: [:show]
  before_action :require_permission, only: [:update,:destroy]

  def is_recruiter
    if current_user.is_recruiter != true
      redirect_to edit_user_registration_url, flash: { error: "You do not have permission to do that." }
    end
  end
  
  def require_permission
    if Company.find(params[:id]).recruiter != current_user
      redirect_to edit_user_registration_url, flash: { error: "You do not have permission to do that." }
    end
  end

    def show
      @company = Company.find(params[:id])
      @review = Review.new
      render :show
    end

    def new
      @company = Company.new
      render :new
    end

    def create
      @company = current_user.companies.new(params.require(:company).permit(:name, :description, :size, :year_established, :email, :phone_number, :address))
      @company.avg_rating = 0.0
      @company.count_ratings = 0
      @company.sum_ratings = 0
      if @company.save
        flash[:success] = "Company added successfully"
        redirect_to company_url(@company)
      else
        flash.now[:error] = "Company creation failed"
        render :new
      end
    end

    def update
      @company = Company.find(params[:id])
      if @company.update(params.require(:company).permit(:name, :description, :size, :year_established, :email, :phone_number, :address))
        flash[:success] = "Company updated successfully"
        redirect_to company_url(@company)
      else
        flash.now[:error] = "Company update failed :/"
        render :show
      end
    end

    def destroy
      @company = Company.find(params[:id])
      @company.destroy
      flash[:success] = "The company was successfully destroyed."
      redirect_to edit_user_registration_url
    end

end
