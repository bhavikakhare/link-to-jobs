class JobPostingsController < ApplicationController
    before_action :authenticate_user!, except: [:index]
    before_action :is_recruiter, except: [:show,:index]
    before_action :require_permission, only: [:destroy]
  
    def is_recruiter
      if current_user.is_recruiter != true
        redirect_to job_postings_url, flash: { error: "You do not have permission to do that." }
      end
    end
    
    def require_permission
      if JobPosting.find(params[:id]).company.recruiter != current_user
        redirect_to job_postings_url, flash: { error: "You do not have permission to do that." }
      end
    end

    def index
        @interests_only = false
        search_title = params[:search_title]
        search_company = params[:search_company].to_s.downcase
        if !search_title
          search_title = ""
        end
        @interests_only = params[:interests_only]
        @job_postings = JobPosting.where("title LIKE ?", "%" + search_title + "%")
        if !search_company.blank?
          search_company_id = Company.find_by("lower(name) = ?", search_company.downcase)
          @job_postings = @job_postings.where(company_id: search_company_id)
        end
        render :index
    end

    def show
        @job_postings = JobPosting.find(params[:id])
        if current_user.is_recruiter == false && @job_postings.is_closed == true
          redirect_to job_postings_url, flash: { error: "Job posting is closed." }
        else
          render :show
        end
    end

    def new
        @job_posting = JobPosting.new
        render :new
    end

    def create
        @job_posting = JobPosting.new(params.require(:job_posting).permit(:title, :job_category, :summary, :experience_required, :company_id, :tag_list, :is_closed))
        if @job_posting.save
            @question = @job_posting.questions.build(params.permit(:question)) 
            flash[:success] = "New job posting successfully added!"
            redirect_to new_jp_question_path(@job_posting, @question)
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

    def is_closed
      @job_posting = JobPosting.find(params[:id])
      @job_posting.update(is_closed: true)
      redirect_to job_posting_url
    end

end