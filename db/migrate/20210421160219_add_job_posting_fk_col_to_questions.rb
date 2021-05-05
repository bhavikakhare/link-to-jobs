class AddJobPostingFkColToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_reference :questions, :job_posting, foreign_key: true
  end
end
