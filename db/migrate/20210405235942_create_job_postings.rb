class CreateJobPostings < ActiveRecord::Migration[6.1]
  def change
    create_table :job_postings do |t|
      t.string :job_category
      t.string :title
      t.string :summary
      t.integer :experience_required
      t.boolean :is_closed

      t.timestamps
    end
  end
end
