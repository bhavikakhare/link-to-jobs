class AnswersController < ApplicationController

    def new
        @job_posting = JobPosting.find(params[:posting_id])
        @job_application = JobApplication.find(params[:id])
        @questions = @job_posting.questions
        @answer = Answer.new
        @answers = @job_application.answers
        render :new
    end

    def create
        @job_posting = JobPosting.find(params[:posting_id])
        @job_application = JobApplication.find(params[:id])
        @answer = @job_application.answers.build(params.require(:answer).permit(:answer,:question_id))
        if @answer.save
            flash[:success] = "Answer saved successfully"
            redirect_to new_ja_answer_url(@job_posting,@job_application)
        else
            flash.now[:error] = "Answer could not be saved"
            redirect_to new_ja_answer_url(@job_posting,@job_application)
        end
    end

end
