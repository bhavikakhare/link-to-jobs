class QuestionsController < ApplicationController


    def index
        @job_posting = JobPosting.find(params[:id])
        @questions = @job_posting.questions
        render :index
    end

    def new
        @job_posting = JobPosting.find(params[:id])
        @question = Question.new
        @questions = @job_posting.questions
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
            render :new
        end
    end
end