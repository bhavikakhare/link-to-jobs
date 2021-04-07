class JobPostingsController < ApplicationController

    def index
        @job_postings = JobPosting.all
        render :index
    end

    def show
        @job_postings = JobPosting.find(params[:id])
        render :show
    end

    def new
        @job_posting = JobPosting.new
        render :new
    end

    # def create
    #     @job_posting = JobPosting.new(params.require(:job_posting).permit(:title, :job_category, :summary, :experience_required))
    #     if @job_posting.save
    #         flash[:success] = "New job posting successfully added!"
    #         redirect_to job_postings_url
    #     else
    #         flash.now[:error] = "Job posting creation failed"
    #         render :new            
    #     end
    # end

    def create
        @job_posting = JobPosting.new(params.require(:job_posting).permit(:title, :job_category, :summary, :experience_required))
        if @job_posting.save
            flash[:success] = "New job posting successfully added!"
            redirect_to job_postings_url
        else
            flash.now[:error] = "Job posting creation failed"
            render :new
        end
    end

    def destroy
        @job_posting = JobPosting.find(params[:id])
        @job_posting.destroy
        flash[:success] = "The job posting was successfully destroyed."
        redirect_to job_postings_url

    end
end