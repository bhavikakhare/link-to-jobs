class AddRecruiterFkColToCompany < ActiveRecord::Migration[6.1]
  def change
    add_reference :companies, :recruiter, foreign_key: { to_table: :users }
  end
end
