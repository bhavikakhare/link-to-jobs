class JobPostingsController < ApplicationController

    def index
        @job_postings = JobPosting.all
        render :index
    end
end
