class AddSchoolToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :highest_degree_school, :string
  end
end
