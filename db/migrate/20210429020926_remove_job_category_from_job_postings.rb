class RemoveJobCategoryFromJobPostings < ActiveRecord::Migration[6.1]
  def change
    remove_column :job_postings, :job_category, :string
  end
end
