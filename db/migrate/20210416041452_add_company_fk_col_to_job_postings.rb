class AddCompanyFkColToJobPostings < ActiveRecord::Migration[6.1]
  def change
    add_reference :job_postings, :company, foreign_key: true
  end
end
