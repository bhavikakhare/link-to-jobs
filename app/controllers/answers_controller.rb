class AnswersController < ApplicationController

    def new
        @job_posting = JobPosting.find(params[:posting_id])
        @job_application = JobApplication.find(params[:id])
        @questions = @job_posting.questions
        @answer = Answer.new
        @answer.job_application = @job_application
        @answers = @job_application.answers
        render :new
    end

    def create
        @job_posting = JobPosting.find(params[:id])
        @question = @job_posting.questions.build(params.require(:question).permit(:question))
        if @question.save
            flash[:success] = "Question saved successfully"
            redirect_to new_jp_question_url(@job_posting)
        else
            flash.now[:error] = "Question could not be saved"
            redirect_to new_jp_question_url(@job_posting)
        end
    end

end
