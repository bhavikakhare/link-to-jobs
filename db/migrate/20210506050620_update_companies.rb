class UpdateCompanies < ActiveRecord::Migration[6.1]
  def change
    change_column :companies, :sum_ratings, :decimal
  end
end
