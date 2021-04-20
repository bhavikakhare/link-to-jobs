class JobApplicationsController < ApplicationController
    before_action :authenticate_user!
    before_action :is_applicant, except: [:index, :show]
    before_action :require_permission, except: [:new, :create]
    
    def is_applicant
        if current_user.is_recruiter
            redirect_to job_postings_url, flash: { error: "You do not have permission to do that." }
        end
    end

    def require_permission
        if current_user != User.find(params[:user_id])
            redirect_to job_postings_url, flash: { error: "You do not have permission to do that." }
            return
        end
        if current_user != JobPosting.find(params[:posting_id]).company.recruiter
            redirect_to job_postings_url, flash: { error: "You do not have permission to do that." }
        end
    end

    def index
        if current_user.is_recruiter
            @posting = JobPosting.find(params[:posting_id])
            @applications = @posting.job_applications
        else
            @applications = current_user.job_applications
        end
        render :index
    end

    def show
        if current_user.is_recruiter
            @posting = JobPosting.find(params[:posting_id])
            @application = @posting.job_applications.find(params[:id])
        else
            @application = current_user.job_applications.find(params[:id])
        end
        render :show
    end

    def new
        @posting = JobPosting.find(params[:id])
        @application = JobApplication.new
        render :new
    end

    def create
        @posting = JobPosting.find(params[:id])
        @application = JobApplication.new(params.require(:job_application).permit(:user_id, :job_posting_id))
        if @application.save
            flash[:success] = 'Application was successfully submitted'
            redirect_to job_applications_a_url(current_user)
        else
            flash.now[:error] = "You have errors.  Try again"
            render :new
        end
    end

    def destroy
        @application = JobApplication.find(params[:id])
        @application.destroy
        flash[:success] = 'Application was successfully revoked'
        redirect_to job_applications_a_url(current_user)
    end
end
